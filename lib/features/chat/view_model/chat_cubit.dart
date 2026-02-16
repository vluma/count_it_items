import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/features/chat/view_model/chat_event.dart';
import 'package:youwu/features/chat/view_model/chat_state.dart';
import 'package:youwu/core/services/speech_service.dart';

class ChatCubit extends Bloc<ChatEvent, ChatState> {
  final ItemRepository itemRepository;
  final SpeechService speechService;

  ChatCubit({required this.itemRepository, required this.speechService}) : super(const ChatState.initial()) {
    on<Initialize>(_onInitialize);
    on<SendMessage>(_onSendMessage);
    on<SendImage>(_onSendImage);
    on<SendScanResult>(_onSendScanResult);
    on<LoadItems>(_onLoadItems);
    on<LoadItemsByRoom>(_onLoadItemsByRoom);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
    on<SearchItems>(_onSearchItems);
    on<ShowItemDetail>(_onShowItemDetail);
    on<ShowItemForm>(_onShowItemForm);
    on<ClearChat>(_onClearChat);
    on<StartSpeechRecognition>(_onStartSpeechRecognition);
    on<StopSpeechRecognition>(_onStopSpeechRecognition);
    on<SpeakMessage>(_onSpeakMessage);
    on<StopSpeaking>(_onStopSpeaking);

    add(const Initialize());
  }

  void _onInitialize(Initialize event, Emitter<ChatState> emit) {
    emit(const ChatState.loaded(messages: [], isTyping: false));
    _addBotMessage(
      '你好！我是你的物品管理助手。我可以帮你：\n\n'
          '• 查看所有物品\n'
          '• 按房间筛选物品\n'
          '• 添加新物品\n'
          '• 修改物品信息\n'
          '• 删除物品\n'
          '• 搜索物品\n\n'
          '请告诉我你想做什么？',
      emit,
    );
  }

  void _addBotMessage(String content, Emitter<ChatState> emit, {MessageType type = MessageType.text, List<ItemEntity> items = const [], ItemEntity? selectedItem, String actionType = '', String? scanValue, String? scanType}) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          isUser: false,
          timestamp: DateTime.now(),
          type: type,
          items: items,
          selectedItem: selectedItem,
          actionType: actionType,
          scanValue: scanValue,
          scanType: scanType,
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: false,
          isListening: isListening,
          isSpeaking: isSpeaking,
          recognizedText: recognizedText,
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );
  }

  void _addUserMessage(String content, Emitter<ChatState> emit) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          isUser: true,
          timestamp: DateTime.now(),
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: true,
          isListening: false,
          isSpeaking: isSpeaking,
          recognizedText: '',
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    _addUserMessage(event.content, emit);

    await Future.delayed(const Duration(milliseconds: 500));

    final response = _processUserMessage(event.content);

    if (response['action'] == 'list') {
      await _onLoadItems(LoadItems(), emit);
      return;
    }

    if (response['action'] == 'search' && response['query'] != null) {
      await _onSearchItems(SearchItems(query: response['query'] as String), emit);
      return;
    }

    if (response['action'] == 'add') {
      state.maybeWhen(
        loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
          emit(ChatState.loaded(
            messages: messages,
            isTyping: false,
            isListening: isListening,
            isSpeaking: isSpeaking,
            recognizedText: recognizedText,
            speakingMessageId: speakingMessageId,
          ));
        },
        orElse: () {},
      );
      _addBotMessage('好的，请告诉我物品的详细信息：', emit, type: MessageType.itemForm);
      return;
    }

    _addBotMessage(response['message'] as String, emit);
  }

  Map<String, dynamic> _processUserMessage(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('查看') || lowerMessage.contains('列表') || lowerMessage.contains('所有物品')) {
      return {'action': 'list', 'message': '正在获取物品列表...'};
    }

    if (lowerMessage.contains('搜索') || lowerMessage.contains('查找')) {
      final query = message.replaceAll(RegExp(r'搜索|查找|物品|的'), '').trim();
      return {'action': 'search', 'query': query, 'message': '正在搜索...'};
    }

    if (lowerMessage.contains('添加') || lowerMessage.contains('新增') || lowerMessage.contains('创建')) {
      return {'action': 'add', 'message': '正在打开添加表单...'};
    }

    return {
      'action': 'unknown',
      'message': '我理解你想："$message"\n\n你可以尝试说：\n'
          '• "查看所有物品"\n'
          '• "搜索沙发"\n'
          '• "添加新物品"\n'
          '• "删除物品"'
    };
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<ChatState> emit) async {
    try {
      final items = await itemRepository.getItems();
      _addBotMessage(
        '共有 ${items.length} 件物品：',
        emit,
        type: MessageType.itemList,
        items: items,
      );
    } catch (e) {
      log('Load items error: $e', name: 'ChatCubit');
      _addBotMessage('获取物品列表失败，请稍后重试。', emit);
    }
  }

  Future<void> _onLoadItemsByRoom(LoadItemsByRoom event, Emitter<ChatState> emit) async {
    try {
      final items = await itemRepository.getItemsByRoom(event.roomId);
      _addBotMessage(
        '该房间共有 ${items.length} 件物品：',
        emit,
        type: MessageType.itemList,
        items: items,
      );
    } catch (e) {
      log('Load items by room error: $e', name: 'ChatCubit');
      _addBotMessage('获取房间物品失败，请稍后重试。', emit);
    }
  }

  Future<void> _onAddItem(AddItem event, Emitter<ChatState> emit) async {
    try {
      final item = await itemRepository.addItem(event.item);
      _addBotMessage(
        '已成功添加物品"${item.name}"',
        emit,
        type: MessageType.actionResult,
        actionType: 'add',
      );
    } catch (e) {
      log('Add item error: $e', name: 'ChatCubit');
      _addBotMessage('添加物品失败，请稍后重试。', emit);
    }
  }

  Future<void> _onUpdateItem(UpdateItem event, Emitter<ChatState> emit) async {
    try {
      final item = await itemRepository.updateItem(event.item);
      _addBotMessage(
        '已成功更新物品"${item.name}"',
        emit,
        type: MessageType.actionResult,
        actionType: 'update',
      );
    } catch (e) {
      log('Update item error: $e', name: 'ChatCubit');
      _addBotMessage('更新物品失败，请稍后重试。', emit);
    }
  }

  Future<void> _onDeleteItem(DeleteItem event, Emitter<ChatState> emit) async {
    try {
      await itemRepository.deleteItem(event.itemId);
      _addBotMessage(
        '已成功删除物品',
        emit,
        type: MessageType.actionResult,
        actionType: 'delete',
      );
    } catch (e) {
      log('Delete item error: $e', name: 'ChatCubit');
      _addBotMessage('删除物品失败，请稍后重试。', emit);
    }
  }

  Future<void> _onSearchItems(SearchItems event, Emitter<ChatState> emit) async {
    try {
      final items = await itemRepository.searchItems(event.query);
      if (items.isEmpty) {
        _addBotMessage('没有找到匹配"${event.query}"的物品', emit);
      } else {
        _addBotMessage(
          '找到 ${items.length} 件匹配"${event.query}"的物品：',
          emit,
          type: MessageType.itemList,
          items: items,
        );
      }
    } catch (e) {
      log('Search items error: $e', name: 'ChatCubit');
      _addBotMessage('搜索物品失败，请稍后重试。', emit);
    }
  }

  Future<void> _onShowItemDetail(ShowItemDetail event, Emitter<ChatState> emit) async {
    _addBotMessage(
      '物品详情：',
      emit,
      type: MessageType.itemDetail,
      selectedItem: event.item,
    );
  }

  Future<void> _onShowItemForm(ShowItemForm event, Emitter<ChatState> emit) async {
    _addBotMessage(
      event.item != null ? '编辑物品：' : '添加新物品：',
      emit,
      type: MessageType.itemForm,
      selectedItem: event.item,
    );
  }

  void _onClearChat(ClearChat event, Emitter<ChatState> emit) {
    emit(const ChatState.loaded(messages: [], isTyping: false));
    _addBotMessage(
      '你好！我是你的物品管理助手。我可以帮你：\n\n'
          '• 查看所有物品\n'
          '• 按房间筛选物品\n'
          '• 添加新物品\n'
          '• 修改物品信息\n'
          '• 删除物品\n'
          '• 搜索物品\n\n'
          '请告诉我你想做什么？',
      emit,
    );
  }

  Future<void> _onSendImage(SendImage event, Emitter<ChatState> emit) async {
    _addUserImageMessage(event.imagePath, emit);

    await Future.delayed(const Duration(milliseconds: 500));

    _addBotMessage(
      '我已收到你的图片。由于当前是演示模式，我无法真正识别图片内容。\n\n'
      '在实际应用中，我可以：\n'
      '• 识别图片中的物品\n'
      '• 自动提取物品信息\n'
      '• 帮你添加到物品库中\n\n'
      '请告诉我你想添加什么物品？',
      emit,
      type: MessageType.itemForm,
    );
  }

  Future<void> _onSendScanResult(SendScanResult event, Emitter<ChatState> emit) async {
    _addUserScanMessage(event.value, event.type, emit);

    await Future.delayed(const Duration(milliseconds: 500));

    final typeText = event.type == 'qr' ? '二维码' : '商品条形码';
    _addBotMessage(
      '我已扫描到$typeText：${event.value}\n\n'
      '由于当前是演示模式，我无法真正查询商品信息。\n\n'
      '在实际应用中，我可以：\n'
      '• 查询商品数据库获取商品信息\n'
      '• 自动填充物品名称和类别\n'
      '• 帮你快速添加物品\n\n'
      '请告诉我物品名称，我来帮你添加。',
      emit,
      type: MessageType.itemForm,
      scanValue: event.value,
      scanType: event.type,
    );
  }

  void _addUserImageMessage(String imagePath, Emitter<ChatState> emit) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: '',
          isUser: true,
          timestamp: DateTime.now(),
          type: MessageType.image,
          imagePath: imagePath,
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: true,
          isListening: false,
          isSpeaking: isSpeaking,
          recognizedText: '',
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );
  }

  void _addUserScanMessage(String value, String scanType, Emitter<ChatState> emit) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: '',
          isUser: true,
          timestamp: DateTime.now(),
          type: MessageType.scanResult,
          scanValue: value,
          scanType: scanType,
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: true,
          isListening: false,
          isSpeaking: isSpeaking,
          recognizedText: '',
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> _onStartSpeechRecognition(StartSpeechRecognition event, Emitter<ChatState> emit) async {
    final initialized = await speechService.initialize();
    if (!initialized) {
      log('Speech recognition initialization failed', name: 'ChatCubit');
      return;
    }

    state.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        emit(ChatState.loaded(
          messages: messages,
          isTyping: isTyping,
          isListening: true,
          isSpeaking: isSpeaking,
          recognizedText: '',
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );

    await speechService.startListening();
  }

  Future<void> _onStopSpeechRecognition(StopSpeechRecognition event, Emitter<ChatState> emit) async {
    await speechService.stopListening();

    final recognizedText = speechService.lastRecognizedWords;

    state.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        emit(ChatState.loaded(
          messages: messages,
          isTyping: isTyping,
          isListening: false,
          isSpeaking: isSpeaking,
          recognizedText: recognizedText,
          speakingMessageId: speakingMessageId,
        ));
      },
      orElse: () {},
    );

    if (recognizedText.isNotEmpty) {
      add(SendMessage(content: recognizedText));
    }
  }

  Future<void> _onSpeakMessage(SpeakMessage event, Emitter<ChatState> emit) async {
    await speechService.stopSpeaking();

    state.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        final messageIndex = messages.indexWhere((m) => m.content == event.message);
        emit(ChatState.loaded(
          messages: messages,
          isTyping: isTyping,
          isListening: isListening,
          isSpeaking: true,
          recognizedText: recognizedText,
          speakingMessageId: messageIndex >= 0 ? messages[messageIndex].id : null,
        ));
      },
      orElse: () {},
    );

    await speechService.speak(event.message);

    state.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        emit(ChatState.loaded(
          messages: messages,
          isTyping: isTyping,
          isListening: isListening,
          isSpeaking: false,
          recognizedText: recognizedText,
          speakingMessageId: null,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> _onStopSpeaking(StopSpeaking event, Emitter<ChatState> emit) async {
    await speechService.stopSpeaking();

    state.maybeWhen(
      loaded: (messages, isTyping, isListening, isSpeaking, recognizedText, speakingMessageId) {
        emit(ChatState.loaded(
          messages: messages,
          isTyping: isTyping,
          isListening: isListening,
          isSpeaking: false,
          recognizedText: recognizedText,
          speakingMessageId: null,
        ));
      },
      orElse: () {},
    );
  }
}
