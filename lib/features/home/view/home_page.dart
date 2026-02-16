import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_event.dart';
import 'package:youwu/features/home/view_model/map_state.dart';
import 'package:youwu/features/home/view/widgets/home_app_bar.dart';
import 'package:youwu/features/home/view/widgets/map_painter.dart';
import 'package:youwu/features/home/view/widgets/room_card.dart';
import 'package:youwu/features/home/view/widgets/ai_input_bar.dart';
import 'package:youwu/features/home/view/widgets/expiration_alert_card.dart';

enum ViewMode { map, list }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewMode _viewMode = ViewMode.map;
  final TransformationController _transformationController = TransformationController();
  final GlobalKey _customPaintKey = GlobalKey();
  Offset? _pointerDownPosition;
  int? _pointerDownTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MapCubit>().add(const LoadMap());
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safePadding = MediaQuery.of(context).padding;
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _buildBackground(colors),
                    _buildMainContent(state, colors, safePadding),
                    Positioned(
                      top: safePadding.top,
                      left: 0,
                      right: 0,
                      child: HomeAppBar(
                        viewMode: _viewMode,
                        onViewModeChanged: (mode) {
                          setState(() {
                            _viewMode = mode;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const AiInputBar(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackground(AppColorsData colors) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.background,
            colors.background.withValues(alpha: 0.95),
            colors.surface.withValues(alpha: 0.3),
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
    );
  }

  Widget _buildMainContent(MapState state, AppColorsData colors, EdgeInsets safePadding) {
    return Positioned.fill(
      top: 100.h + safePadding.top,
      child: state.maybeWhen(
        success: (space, showOverlay, isSearching, expiredItems, expiringItems) {
          return Column(
            children: [
              if (expiredItems.isNotEmpty || expiringItems.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ExpirationAlertCard(
                    expiredItems: expiredItems,
                    expiringItems: expiringItems,
                  ),
                ),
              Expanded(
                child: _viewMode == ViewMode.map
                    ? _buildMapView(state, context)
                    : _buildListView(space.rooms, colors),
              ),
            ],
          );
        },
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildMapView(MapState state, BuildContext context) {
    final colors = AppColors.of(context);
    final painter = MapPainter(
      state: state,
      onRoomTap: (roomId) {
        context.read<MapCubit>().add(SelectRoom(roomId: roomId));
      },
      colors: colors,
    );

    return Listener(
      onPointerDown: (event) {
        _pointerDownPosition = event.localPosition;
        _pointerDownTime = DateTime.now().millisecondsSinceEpoch;
      },
      onPointerUp: (event) {
        if (_pointerDownPosition == null || _pointerDownTime == null) return;
        
        final timeDiff = DateTime.now().millisecondsSinceEpoch - _pointerDownTime!;
        final distance = (event.localPosition - _pointerDownPosition!).distance;
        
        if (timeDiff < 500 && distance < 20) {
          final RenderBox? customPaintBox = _customPaintKey.currentContext?.findRenderObject() as RenderBox?;
          if (customPaintBox == null) return;
          final size = customPaintBox.size;
          
          final transform = _transformationController.value;
          final inverseTransform = Matrix4.inverted(transform);
          final transformedPoint = MatrixUtils.transformPoint(inverseTransform, event.localPosition);
          
          final roomId = painter.hitTestRoom(transformedPoint, size);
          if (roomId != null) {
            context.read<MapCubit>().add(SelectRoom(roomId: roomId));
          }
        }
        
        _pointerDownPosition = null;
        _pointerDownTime = null;
      },
      child: InteractiveViewer(
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(200),
        minScale: 0.1,
        maxScale: 5.0,
        panEnabled: true,
        scaleEnabled: true,
        child: RepaintBoundary(
          child: CustomPaint(
            key: _customPaintKey,
            painter: painter,
            size: Size.infinite,
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<RoomEntity> rooms, AppColorsData colors) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: RoomCard(room: rooms[index]),
        );
      },
    );
  }
}
