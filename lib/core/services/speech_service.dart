import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

enum SpeechRecognitionState {
  notStarted,
  listening,
  stopped,
  error,
}

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  bool _isInitialized = false;
  bool _isListening = false;
  String _lastRecognizedWords = '';
  SpeechRecognitionState _recognitionState = SpeechRecognitionState.notStarted;
  String? _currentSpeakingText;

  bool get isListening => _isListening;
  String get lastRecognizedWords => _lastRecognizedWords;
  SpeechRecognitionState get recognitionState => _recognitionState;
  String? get currentSpeakingText => _currentSpeakingText;

  final Function(String, bool)? onRecognitionResult;
  final Function(SpeechRecognitionState)? onStateChanged;
  final Function()? onSpeechCompleted;

  SpeechService({
    this.onRecognitionResult,
    this.onStateChanged,
    this.onSpeechCompleted,
  });

  Future<bool> initialize() async {
    if (_isInitialized) return true;

    try {
      final hasPermission = await _requestPermissions();
      if (!hasPermission) {
        _recognitionState = SpeechRecognitionState.error;
        onStateChanged?.call(_recognitionState);
        return false;
      }

      final available = await _speechToText.initialize(
        onError: (error) {
          log('Speech recognition error: ${error.errorMsg}');
          _isListening = false;
          _recognitionState = SpeechRecognitionState.error;
          onStateChanged?.call(_recognitionState);
        },
        onStatus: (status) {
          log('Speech recognition status: $status');
          if (status == 'done' || status == 'notListening') {
            _isListening = false;
            _recognitionState = SpeechRecognitionState.stopped;
            onStateChanged?.call(_recognitionState);
          }
        },
      );

      if (available) {
        await _initTts();
        _isInitialized = true;
      }

      return available;
    } catch (e) {
      log('SpeechService initialization error: $e');
      _recognitionState = SpeechRecognitionState.error;
      onStateChanged?.call(_recognitionState);
      return false;
    }
  }

  Future<bool> _requestPermissions() async {
    final microphoneStatus = await Permission.microphone.request();
    final speechStatus = await Permission.speech.request();

    return microphoneStatus.isGranted && speechStatus.isGranted;
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage('zh-CN');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    _flutterTts.setCompletionHandler(() {
      _currentSpeakingText = null;
      onSpeechCompleted?.call();
    });

    _flutterTts.setErrorHandler((message) {
      log('TTS error: $message');
      _currentSpeakingText = null;
    });
  }

  Future<void> startListening() async {
    if (!_isInitialized) {
      final initialized = await initialize();
      if (!initialized) return;
    }

    if (_isListening) return;

    _lastRecognizedWords = '';
    _recognitionState = SpeechRecognitionState.listening;
    onStateChanged?.call(_recognitionState);

    await _speechToText.listen(
      onResult: (result) {
        _lastRecognizedWords = result.recognizedWords;
        onRecognitionResult?.call(
          result.recognizedWords,
          result.finalResult,
        );

        if (result.finalResult) {
          _isListening = false;
          _recognitionState = SpeechRecognitionState.stopped;
          onStateChanged?.call(_recognitionState);
        }
      },
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 3),
      localeId: 'zh_CN',
      listenOptions: SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
      ),
    );

    _isListening = true;
  }

  Future<void> stopListening() async {
    if (!_isListening) return;

    await _speechToText.stop();
    _isListening = false;
    _recognitionState = SpeechRecognitionState.stopped;
    onStateChanged?.call(_recognitionState);
  }

  Future<void> cancelListening() async {
    await _speechToText.cancel();
    _isListening = false;
    _lastRecognizedWords = '';
    _recognitionState = SpeechRecognitionState.notStarted;
    onStateChanged?.call(_recognitionState);
  }

  Future<void> speak(String text) async {
    if (text.isEmpty) return;

    await stopSpeaking();

    _currentSpeakingText = text;
    await _flutterTts.speak(text);
  }

  Future<void> stopSpeaking() async {
    _currentSpeakingText = null;
    await _flutterTts.stop();
  }

  Future<void> setSpeechRate(double rate) async {
    await _flutterTts.setSpeechRate(rate);
  }

  Future<void> setLanguage(String language) async {
    await _flutterTts.setLanguage(language);
  }

  Future<List<String>> getAvailableLanguages() async {
    final languages = await _flutterTts.getLanguages;
    return languages?.cast<String>() ?? [];
  }

  void dispose() {
    _speechToText.cancel();
    _flutterTts.stop();
  }
}
