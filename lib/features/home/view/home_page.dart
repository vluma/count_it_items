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
import 'package:youwu/features/home/view/widgets/stats_panel.dart';
import 'package:youwu/features/home/view/widgets/floating_action_button.dart';

enum ViewMode { map, list }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  ViewMode _viewMode = ViewMode.map;
  late AnimationController _fabAnimationController;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safePadding = MediaQuery.of(context).padding;
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: BlocProvider.value(
        value: context.read<MapCubit>()..add(const LoadMap()),
        child: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return Stack(
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
                Positioned(
                  bottom: safePadding.bottom + 100.h,
                  right: 20.w,
                  child: HomeFloatingActionButton(
                    animationController: _fabAnimationController,
                  ),
                ),
              ],
            );
          },
        ),
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
        success: (space, showOverlay, isSearching) {
          return Column(
            children: [
              StatsPanel(space: space),
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
    return GestureDetector(
      onDoubleTap: () {
        context.read<MapCubit>().add(const DoubleTapEmpty());
      },
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(200),
        minScale: 0.1,
        maxScale: 5.0,
        panEnabled: true,
        scaleEnabled: true,
        child: RepaintBoundary(
          child: CustomPaint(
            painter: MapPainter(
              state: state,
              onRoomTap: (roomId) {
                context.read<MapCubit>().add(SelectRoom(roomId: roomId));
              },
              colors: colors,
            ),
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
