import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:youwu/core/theme/app_colors.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> with SingleTickerProviderStateMixin {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );
  bool _isScanned = false;
  late AnimationController _scanAnimationController;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _scanAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scanAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanAnimationController, curve: Curves.easeInOut),
    );
    _scanAnimationController.repeat();
  }

  @override
  void dispose() {
    _scanAnimationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleDetection(BarcodeCapture capture) {
    if (_isScanned) return;

    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final barcode = barcodes.first;
    final value = barcode.rawValue;
    if (value == null || value.isEmpty) return;

    _isScanned = true;
    _scanAnimationController.stop();
    _controller.stop();

    final format = barcode.format;
    String formatName;
    switch (format) {
      case BarcodeFormat.ean13:
      case BarcodeFormat.ean8:
      case BarcodeFormat.upcA:
      case BarcodeFormat.upcE:
        formatName = '商品条形码';
        break;
      case BarcodeFormat.qrCode:
        formatName = '二维码';
        break;
      default:
        formatName = '条码';
    }

    Navigator.of(context).pop({
      'value': value,
      'format': formatName,
      'type': format == BarcodeFormat.qrCode ? 'qr' : 'barcode',
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '扫码',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: colors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.flash_off_rounded, color: colors.textSecondary),
            onPressed: () => _controller.toggleTorch(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _handleDetection,
          ),
          _buildScanOverlay(colors),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 32.h,
            child: _buildInstructions(colors),
          ),
        ],
      ),
    );
  }

  Widget _buildScanOverlay(AppColorsData colors) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scanAreaSize = 280.w;
        final left = (constraints.maxWidth - scanAreaSize) / 2;
        final top = (constraints.maxHeight - scanAreaSize) / 2 - 50.h;

        return Stack(
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _ScanOverlayPainter(
                scanArea: Rect.fromLTWH(left, top, scanAreaSize, scanAreaSize),
                overlayColor: Colors.black.withValues(alpha: 0.6),
                cornerColor: colors.primary,
                cornerWidth: 4,
              ),
            ),
            Positioned(
              left: left,
              top: top,
              width: scanAreaSize,
              height: scanAreaSize,
              child: _buildScanLine(colors, scanAreaSize),
            ),
          ],
        );
      },
    );
  }

  Widget _buildScanLine(AppColorsData colors, double height) {
    return AnimatedBuilder(
      animation: _scanAnimation,
      builder: (context, child) {
        final position = _scanAnimation.value * height * 0.9;
        return Stack(
          children: [
            Positioned(
              left: 8.w,
              right: 8.w,
              top: position,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colors.primary.withValues(alpha: 0),
                      colors.primary,
                      colors.primary.withValues(alpha: 0),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInstructions(AppColorsData colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.qr_code_scanner_rounded,
            color: colors.primary,
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            '将条形码或二维码放入框内',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '支持商品条形码和二维码',
            style: TextStyle(
              fontSize: 13.sp,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanOverlayPainter extends CustomPainter {
  final Rect scanArea;
  final Color overlayColor;
  final Color cornerColor;
  final double cornerWidth;

  _ScanOverlayPainter({
    required this.scanArea,
    required this.overlayColor,
    required this.cornerColor,
    required this.cornerWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = overlayColor;
    final cornerPaint = Paint()
      ..color = cornerColor
      ..strokeWidth = cornerWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(scanArea, Radius.circular(12.r)))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, overlayPaint);

    final cornerLength = 24.w;

    final left = scanArea.left;
    final top = scanArea.top;
    final right = scanArea.right;
    final bottom = scanArea.bottom;

    canvas.drawLine(Offset(left, top + cornerLength), Offset(left, top), cornerPaint);
    canvas.drawLine(Offset(left, top), Offset(left + cornerLength, top), cornerPaint);

    canvas.drawLine(Offset(right - cornerLength, top), Offset(right, top), cornerPaint);
    canvas.drawLine(Offset(right, top), Offset(right, top + cornerLength), cornerPaint);

    canvas.drawLine(Offset(right, bottom - cornerLength), Offset(right, bottom), cornerPaint);
    canvas.drawLine(Offset(right, bottom), Offset(right - cornerLength, bottom), cornerPaint);

    canvas.drawLine(Offset(left + cornerLength, bottom), Offset(left, bottom), cornerPaint);
    canvas.drawLine(Offset(left, bottom), Offset(left, bottom - cornerLength), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant _ScanOverlayPainter oldDelegate) {
    return oldDelegate.scanArea != scanArea ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.cornerColor != cornerColor;
  }
}
