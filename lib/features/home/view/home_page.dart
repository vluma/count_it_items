import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:count_it_items/core/theme/app_colors.dart';
import 'package:count_it_items/features/home/view_model/map_cubit.dart';
import 'package:count_it_items/features/home/view_model/map_event.dart';
import 'package:count_it_items/features/home/view_model/map_state.dart';
import 'package:count_it_items/features/home/view/widgets/home_header.dart';
import 'package:count_it_items/features/home/view/widgets/home_bottom_dock.dart';
import 'package:count_it_items/features/home/view/widgets/map_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider.value(
        value: context.read<MapCubit>()..add(const LoadMap()),
        child: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return Stack(
              children: [
                // 中层：动态平面图画布
                _buildCanvas(state, context),
                
                // 顶层：状态感应区
                Positioned(
                  top: 60,
                  left: 24,
                  right: 24,
                  child: const HomeHeader(),
                ),
                
                // 底层：全局搜索与快捷工具
                Positioned(
                  bottom: 40,
                  left: 24,
                  right: 24,
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
    return GestureDetector(
      // 双击空白处回归中心
      onDoubleTap: () {
        context.read<MapCubit>().add(const DoubleTapEmpty());
      },
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2.0,
        // 支持惯性平移
        panEnabled: true,
        scaleEnabled: true,
        child: CustomPaint(
          painter: MapPainter(
            state: state,
            onRoomTap: (roomId) {
              context.read<MapCubit>().add(SelectRoom(roomId: roomId));
            },
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}
