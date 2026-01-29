import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:youwu/core/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blurRadius;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  
  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.blurRadius = 16,
    this.backgroundColor = AppColors.glassLight,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: AppColors.borderLight,
                width: 1,
              ),
              boxShadow: AppColors.shadowColor == null ? [] : [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: onTap != null
                ? InkWell(
                    onTap: onTap,
                    child: child,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
