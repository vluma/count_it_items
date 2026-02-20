import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youwu/core/di/di.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/core/services/speech_service.dart';
import 'package:youwu/features/chat/view_model/chat_cubit.dart';
import 'package:youwu/features/chat/view/chat_page.dart';
import 'package:youwu/features/home/view/room_drawing_page.dart';
import 'package:youwu/features/home/view/room_form_page.dart';
import 'package:youwu/features/home/view/scanner_page.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/shared/widgets/glass_card.dart';

class AiInputBar extends StatefulWidget {
  final VoidCallback? onExpand;
  final bool isExpanded;

  const AiInputBar({
    super.key,
    this.onExpand,
    this.isExpanded = false,
  });

  @override
  State<AiInputBar> createState() => _AiInputBarState();
}

class _AiInputBarState extends State<AiInputBar> with SingleTickerProviderStateMixin {
  final _textController = TextEditingController();
  final _speechService = SpeechService(
    onStateChanged: (state) {
      log('Speech state: $state');
    },
    onRecognitionResult: (text, isFinal) {
      log('Speech result: $text, isFinal: $isFinal');
    },
  );
  bool _isListening = false;
  bool _showQuickActions = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    await _speechService.initialize();
  }

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    _speechService.dispose();
    super.dispose();
  }

  void _toggleQuickActions() {
    setState(() {
      _showQuickActions = !_showQuickActions;
      if (_showQuickActions) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speechService.stopListening();
      setState(() {
        _isListening = false;
      });
    } else {
      setState(() {
        _isListening = true;
      });
      await _speechService.startListening();
      setState(() {
        _isListening = false;
        if (_speechService.lastRecognizedWords.isNotEmpty) {
          _textController.text = _speechService.lastRecognizedWords;
        }
      });
    }
  }

  void _handleSubmit() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _navigateToChat(initialMessage: text);
    _textController.clear();
  }

  void _navigateToChat({
    String? initialMessage,
    String? imagePath,
    String? scanResult,
    String? scanType,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (_) => sl<ChatCubit>(),
          child: ChatPage(
            imagePath: imagePath,
            scanResult: scanResult,
            scanType: scanType,
            initialMessage: initialMessage,
          ),
        ),
      ),
    );
  }

  void _handleAddRoom() async {
    final mapState = context.read<MapCubit>().state;
    final existingRooms = mapState.maybeWhen(
      success: (space, showOverlay, isSearching, expiredItems, expiringItems) => space.rooms,
      orElse: () => <dynamic>[],
    );

    final points = await Navigator.of(context).push<List<Offset>>(
      MaterialPageRoute(
        builder: (context) => RoomDrawingPage(
          existingRooms: List.from(existingRooms),
        ),
      ),
    );

    if (points != null && points.isNotEmpty && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context.read<MapCubit>(),
            child: RoomFormPage(initialPoints: points),
          ),
        ),
      );
    }
  }

  void _handleCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (image == null) return;

    log('Photo taken: ${image.path}', name: 'AiInputBar');
    _navigateToChat(imagePath: image.path);
  }

  void _handleScan() async {
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (context) => const ScannerPage(),
      ),
    );

    if (result == null || !mounted) return;

    final value = result['value'] as String;
    final format = result['format'] as String;
    final type = result['type'] as String;

    log('Scanned: $value ($format)', name: 'AiInputBar');
    _navigateToChat(scanResult: value, scanType: type);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, viewPadding.bottom + 8.h),
      decoration: BoxDecoration(
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showQuickActions) _buildQuickActions(colors),
          _buildInputRow(colors),
        ],
      ),
    );
  }

  Widget _buildInputRow(AppColorsData colors) {
    return Row(
      children: [
        _buildActionButton(
          icon: _showQuickActions ? Icons.close_rounded : Icons.add_rounded,
          onTap: _toggleQuickActions,
          colors: colors,
          isActive: _showQuickActions,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _buildTextInput(colors),
        ),
        SizedBox(width: 10.w),
        _buildMicButton(colors),
        SizedBox(width: 10.w),
        _buildSendButton(colors),
      ],
    );
  }

  Widget _buildTextInput(AppColorsData colors) {
    return Container(
      constraints: BoxConstraints(minHeight: 44.h),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: _isListening ? colors.primary : colors.border.withValues(alpha: 0.3),
          width: _isListening ? 1.5 : 1,
        ),
        boxShadow: _isListening
            ? [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: _isListening ? '正在聆听...' : '询问 AI 或输入指令...',
                hintStyle: TextStyle(
                  color: _isListening ? colors.primary : colors.textTertiary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
              onSubmitted: (_) => _handleSubmit(),
              enabled: !_isListening,
            ),
          ),
          if (_isListening)
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: _buildListeningIndicator(colors),
            ),
        ],
      ),
    );
  }

  Widget _buildListeningIndicator(AppColorsData colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300 + (index * 100)),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: 4.w,
          height: 12.h + (index * 2.h),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        );
      }),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    required AppColorsData colors,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: isActive ? colors.primary.withValues(alpha: 0.1) : colors.surface,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: isActive ? colors.primary : colors.border.withValues(alpha: 0.3),
          ),
        ),
        child: Icon(
          icon,
          size: 22.sp,
          color: isActive ? colors.primary : colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildMicButton(AppColorsData colors) {
    return GestureDetector(
      onTap: _toggleListening,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: _isListening ? colors.error.withValues(alpha: 0.1) : colors.surface,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: _isListening ? colors.error : colors.border.withValues(alpha: 0.3),
          ),
          boxShadow: _isListening
              ? [
                  BoxShadow(
                    color: colors.error.withValues(alpha: 0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Icon(
          _isListening ? Icons.stop_rounded : Icons.mic_rounded,
          size: 22.sp,
          color: _isListening ? colors.error : colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildSendButton(AppColorsData colors) {
    return GestureDetector(
      onTap: _handleSubmit,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          gradient: colors.primaryGradient,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: colors.primaryGlow,
        ),
        child: Icon(
          Icons.send_rounded,
          size: 20.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildQuickActions(AppColorsData colors) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: GlassCard(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '快捷操作',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickActionItem(
                    icon: Icons.auto_awesome_rounded,
                    label: 'AI助手',
                    color: colors.accent,
                    onTap: () => _navigateToChat(),
                    colors: colors,
                  ),
                  _buildQuickActionItem(
                    icon: Icons.search_rounded,
                    label: '搜索商品',
                    color: colors.primary,
                    onTap: () {
                      _textController.text = '搜索 ';
                      _toggleQuickActions();
                    },
                    colors: colors,
                  ),
                  _buildQuickActionItem(
                    icon: Icons.add_home_rounded,
                    label: '新增房间',
                    color: colors.success,
                    onTap: _handleAddRoom,
                    colors: colors,
                  ),
                  _buildQuickActionItem(
                    icon: Icons.camera_alt_rounded,
                    label: '拍照识别',
                    color: colors.warning,
                    onTap: _handleCamera,
                    colors: colors,
                  ),
                  _buildQuickActionItem(
                    icon: Icons.qr_code_scanner_rounded,
                    label: '扫码',
                    color: colors.error,
                    onTap: _handleScan,
                    colors: colors,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required AppColorsData colors,
  }) {
    return GestureDetector(
      onTap: () {
        _toggleQuickActions();
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: color.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(
              icon,
              size: 22.sp,
              color: color,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
