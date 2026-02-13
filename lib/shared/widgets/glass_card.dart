import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:youwu/core/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blurRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool showBorder;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.blurRadius = 20,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.backgroundColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final bgColor = backgroundColor ?? colors.glass;

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: showBorder
                  ? Border.all(
                      color: colors.border.withValues(alpha: 0.5),
                      width: 1,
                    )
                  : null,
              boxShadow: colors.cardShadow,
            ),
            child: onTap != null
                ? InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: child,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
