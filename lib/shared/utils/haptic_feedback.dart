import 'package:vibration/vibration.dart';

class HapticFeedback {
  HapticFeedback._();
  
  // 轻触感反馈
  static Future<void> light() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(duration: 10);
    }
  }
  
  // 中等触感反馈
  static Future<void> medium() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(duration: 50);
    }
  }
  
  // 重触感反馈
  static Future<void> heavy() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(duration: 100);
    }
  }
  
  // 成功触感反馈（连续两次轻振动）
  static Future<void> success() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(pattern: [10, 50, 10]);
    }
  }
  
  // 错误触感反馈（单次重振动）
  static Future<void> error() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(duration: 150);
    }
  }
  
  // 警告触感反馈（单次中等振动）
  static Future<void> warning() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(duration: 75);
    }
  }
}
