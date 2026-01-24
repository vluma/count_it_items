import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:count_it_items/core/theme/app_colors.dart';

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
    this.blurRadius = 10,
    this.backgroundColor = const Color(0xFFFFFFFF),
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
              color: backgroundColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
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
