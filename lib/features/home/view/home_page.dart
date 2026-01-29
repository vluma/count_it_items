import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_event.dart';
import 'package:youwu/features/home/view_model/map_state.dart';
import 'package:youwu/features/home/view/widgets/home_app_bar.dart';
import 'package:youwu/features/home/view/widgets/home_bottom_dock.dart';
import 'package:youwu/features/home/view/widgets/map_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safePadding = MediaQuery.of(context).padding;
    final colors = AppColors.of(context);
    return Scaffold(
      appBar: const HomeAppBar(), 
      backgroundColor: colors.background,
      body: BlocProvider.value(
        value: context.read<MapCubit>()..add(const LoadMap()),
        child: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return Stack(
              children: [
                // 最底层：背景渐变
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.background.withOpacity(1.0),
                        colors.background.withOpacity(0.98),
                        colors.background.withOpacity(0.96),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),

                // 中层：动态平面图画布
                _buildCanvas(state, context),

                // 底层：全局搜索与快捷工具
                Positioned(
                  bottom: safePadding.bottom + 16,
                  left: 16,
                  right: 16,
                  child: const HomeBottomDock(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // 构建画布
  Widget _buildCanvas(MapState state, BuildContext context) {
    final colors = AppColors.of(context);
    return GestureDetector(
      // 双击空白处回归中心
      onDoubleTap: () {
        context.read<MapCubit>().add(const DoubleTapEmpty());
      },
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(200),
        minScale: 0.1,
        maxScale: 5.0,
        // 支持惯性平移
        panEnabled: true,
        scaleEnabled: true,
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: AlwaysStoppedAnimation(1.0), // 基础动画，后续可扩展为动态动画
            builder: (context, child) {
              return CustomPaint(
                painter: MapPainter(
                  state: state,
                  onRoomTap: (roomId) {
                    context.read<MapCubit>().add(SelectRoom(roomId: roomId));
                  },
                  primaryColor: colors.primary,
                  textPrimaryColor: colors.textPrimary,
                  textSecondaryColor: colors.textSecondary,
                  surfaceColor: colors.surface,
                ),
                size: Size.infinite,
              );
            },
          ),
        ),
      ),
    );
  }
}
