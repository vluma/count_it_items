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
                      child: const HomeAppBar(),
                    ),
                    Positioned(
                      right: 16.w,
                      bottom: 16.h,
                      child: _buildViewModeFAB(colors),
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.background,
            colors.surface.withValues(alpha: 0.5),
            colors.background.withValues(alpha: 0.8),
          ],
          stops: const [0.0, 0.4, 1.0],
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
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _viewMode == ViewMode.map
                      ? _buildMapView(state, context)
                      : _buildListView(space.rooms, colors),
                ),
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

    return InteractiveViewer(
      transformationController: _transformationController,
      boundaryMargin: const EdgeInsets.all(200),
      minScale: 0.1,
      maxScale: 5.0,
      panEnabled: true,
      scaleEnabled: true,
      child: RepaintBoundary(
        child: Builder(
          builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details) {
                final RenderBox? customPaintBox = _customPaintKey.currentContext?.findRenderObject() as RenderBox?;
                if (customPaintBox == null) return;
                final size = customPaintBox.size;
                
                final roomId = painter.hitTestRoom(details.localPosition, size);
                if (roomId != null) {
                  context.read<MapCubit>().add(SelectRoom(roomId: roomId));
                }
              },
              child: CustomPaint(
                key: _customPaintKey,
                painter: painter,
                size: Size.infinite,
              ),
            );
          }
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

  Widget _buildViewModeFAB(AppColorsData colors) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _viewMode = _viewMode == ViewMode.map ? ViewMode.list : ViewMode.map;
        });
      },
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          gradient: colors.primaryGradient,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: colors.primaryGlow,
        ),
        child: Icon(
          _viewMode == ViewMode.map ? Icons.list_rounded : Icons.map_outlined,
          size: 22.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
