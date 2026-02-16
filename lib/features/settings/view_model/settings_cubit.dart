import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/domain/entities/settings_entity.dart';
import 'package:youwu/domain/repositories/settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;
  
  SettingsCubit({required this.settingsRepository}) : super(const SettingsState.initial()) {
    loadSettings();
  }
  
  Future<void> loadSettings() async {
    emit(const SettingsState.loading());
    
    try {
      final settings = await settingsRepository.getSettings();
      emit(SettingsState.loaded(settings: settings));
    } catch (e) {
      log('Load settings error: $e', name: 'SettingsCubit');
      emit(SettingsState.error(message: e.toString()));
    }
  }
  
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    try {
      await settingsRepository.updateThemeMode(themeMode);
      final settings = await settingsRepository.getSettings();
      emit(SettingsState.loaded(settings: settings));
    } catch (e) {
      log('Set theme mode error: $e', name: 'SettingsCubit');
    }
  }
  
  Future<void> setLanguageMode(LanguageMode languageMode) async {
    try {
      await settingsRepository.updateLanguageMode(languageMode);
      final settings = await settingsRepository.getSettings();
      emit(SettingsState.loaded(settings: settings));
    } catch (e) {
      log('Set language mode error: $e', name: 'SettingsCubit');
    }
  }
  
  Future<void> setFeishuConfig(String appId, String appSecret) async {
    try {
      await settingsRepository.updateFeishuConfig(appId, appSecret);
      final settings = await settingsRepository.getSettings();
      emit(SettingsState.loaded(settings: settings));
    } catch (e) {
      log('Set feishu config error: $e', name: 'SettingsCubit');
    }
  }
  
  Future<void> setAiConfig(AiProvider provider, String apiKey, String apiEndpoint) async {
    try {
      await settingsRepository.updateAiConfig(provider, apiKey, apiEndpoint);
      final settings = await settingsRepository.getSettings();
      emit(SettingsState.loaded(settings: settings));
    } catch (e) {
      log('Set AI config error: $e', name: 'SettingsCubit');
    }
  }
}
