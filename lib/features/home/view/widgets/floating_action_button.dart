import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/features/home/view/room_form_page.dart';
import 'package:youwu/features/chat/view/chat_page.dart';

class HomeFloatingActionButton extends StatefulWidget {
  final AnimationController animationController;

  const HomeFloatingActionButton({
    super.key,
    required this.animationController,
  });

  @override
  State<HomeFloatingActionButton> createState() => _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        widget.animationController.forward();
      } else {
        widget.animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isExpanded) ..._buildExpandedButtons(colors),
        _buildMainButton(colors),
      ],
    );
  }

  Widget _buildMainButton(AppColorsData colors) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Container(
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          gradient: colors.primaryGradient,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: colors.primaryGlow,
        ),
        child: AnimatedRotation(
          turns: _isExpanded ? 0.125 : 0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            Icons.add_rounded,
            size: 28.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandedButtons(AppColorsData colors) {
    return [
      _buildSubButton(
        icon: Icons.auto_awesome_rounded,
        label: 'AI助手',
        color: colors.accent,
        onTap: () => _handleAIChat(),
        colors: colors,
      ),
      SizedBox(height: 12.h),
      _buildSubButton(
        icon: Icons.add_home_rounded,
        label: '新增房间',
        color: colors.primary,
        onTap: () => _handleAddRoom(),
        colors: colors,
      ),
      SizedBox(height: 12.h),
      _buildSubButton(
        icon: Icons.camera_alt_rounded,
        label: '拍照',
        color: colors.success,
        onTap: () => _handleCamera(),
        colors: colors,
      ),
      SizedBox(height: 12.h),
      _buildSubButton(
        icon: Icons.qr_code_scanner_rounded,
        label: '扫码',
        color: colors.warning,
        onTap: () => _handleScan(),
        colors: colors,
      ),
      SizedBox(height: 12.h),
    ];
  }

  Widget _buildSubButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required AppColorsData colors,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: colors.cardShadow,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: colors.textPrimary,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: () {
            _toggleExpanded();
            onTap();
          },
          child: Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 22.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _handleAIChat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatPage(),
      ),
    );
  }

  void _handleAddRoom() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RoomFormPage(),
      ),
    );
  }

  void _handleCamera() {
    log('Camera tapped', name: 'FAB');
  }

  void _handleScan() {
    log('Scan tapped', name: 'FAB');
  }
}
