import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/features/chat/view_model/chat_event.dart';
import 'package:youwu/features/chat/view_model/chat_state.dart';

class ChatCubit extends Bloc<ChatEvent, ChatState> {
  final ItemRepository itemRepository;
  
  ChatCubit({required this.itemRepository}) : super(const ChatState.initial()) {
    on<SendMessage>(_onSendMessage);
    on<LoadItems>(_onLoadItems);
    on<LoadItemsByRoom>(_onLoadItemsByRoom);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
    on<SearchItems>(_onSearchItems);
    on<ShowItemDetail>(_onShowItemDetail);
    on<ShowItemForm>(_onShowItemForm);
    on<ClearChat>(_onClearChat);
    
    _initializeChat();
  }
  
  void _initializeChat() {
    emit(const ChatState.loaded(messages: [], isTyping: false));
    _addBotMessage('你好！我是你的物品管理助手。我可以帮你：\n\n'
        '• 查看所有物品\n'
        '• 按房间筛选物品\n'
        '• 添加新物品\n'
        '• 修改物品信息\n'
        '• 删除物品\n'
        '• 搜索物品\n\n'
        '请告诉我你想做什么？');
  }
  
  void _addBotMessage(String content, {MessageType type = MessageType.text, List<ItemEntity> items = const [], ItemEntity? selectedItem, String actionType = ''}) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          isUser: false,
          timestamp: DateTime.now(),
          type: type,
          items: items,
          selectedItem: selectedItem,
          actionType: actionType,
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: false,
        ));
      },
      orElse: () {},
    );
  }
  
  void _addUserMessage(String content) {
    final currentState = state;
    currentState.maybeWhen(
      loaded: (messages, isTyping) {
        final message = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          isUser: true,
          timestamp: DateTime.now(),
        );
        emit(ChatState.loaded(
          messages: [...messages, message],
          isTyping: true,
        ));
      },
      orElse: () {},
    );
  }
  
  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    _addUserMessage(event.content);
    
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
        loaded: (messages, isTyping) {
          emit(ChatState.loaded(messages: messages, isTyping: false));
        },
        orElse: () {},
      );
      _addBotMessage('好的，请告诉我物品的详细信息：', type: MessageType.itemForm);
      return;
    }
    
    _addBotMessage(response['message'] as String);
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
        type: MessageType.itemList,
        items: items,
      );
    } catch (e) {
      log('Load items error: $e', name: 'ChatCubit');
      _addBotMessage('获取物品列表失败，请稍后重试。');
    }
  }
  
  Future<void> _onLoadItemsByRoom(LoadItemsByRoom event, Emitter<ChatState> emit) async {
    try {
      final items = await itemRepository.getItemsByRoom(event.roomId);
      _addBotMessage(
        '该房间共有 ${items.length} 件物品：',
        type: MessageType.itemList,
        items: items,
      );
    } catch (e) {
      log('Load items by room error: $e', name: 'ChatCubit');
      _addBotMessage('获取房间物品失败，请稍后重试。');
    }
  }
  
  Future<void> _onAddItem(AddItem event, Emitter<ChatState> emit) async {
    try {
      final item = await itemRepository.addItem(event.item);
      _addBotMessage(
        '已成功添加物品"${item.name}"',
        type: MessageType.actionResult,
        actionType: 'add',
      );
    } catch (e) {
      log('Add item error: $e', name: 'ChatCubit');
      _addBotMessage('添加物品失败，请稍后重试。');
    }
  }
  
  Future<void> _onUpdateItem(UpdateItem event, Emitter<ChatState> emit) async {
    try {
      final item = await itemRepository.updateItem(event.item);
      _addBotMessage(
        '已成功更新物品"${item.name}"',
        type: MessageType.actionResult,
        actionType: 'update',
      );
    } catch (e) {
      log('Update item error: $e', name: 'ChatCubit');
      _addBotMessage('更新物品失败，请稍后重试。');
    }
  }
  
  Future<void> _onDeleteItem(DeleteItem event, Emitter<ChatState> emit) async {
    try {
      await itemRepository.deleteItem(event.itemId);
      _addBotMessage(
        '已成功删除物品',
        type: MessageType.actionResult,
        actionType: 'delete',
      );
    } catch (e) {
      log('Delete item error: $e', name: 'ChatCubit');
      _addBotMessage('删除物品失败，请稍后重试。');
    }
  }
  
  Future<void> _onSearchItems(SearchItems event, Emitter<ChatState> emit) async {
    try {
      final items = await itemRepository.searchItems(event.query);
      if (items.isEmpty) {
        _addBotMessage('没有找到匹配"${event.query}"的物品');
      } else {
        _addBotMessage(
          '找到 ${items.length} 件匹配"${event.query}"的物品：',
          type: MessageType.itemList,
          items: items,
        );
      }
    } catch (e) {
      log('Search items error: $e', name: 'ChatCubit');
      _addBotMessage('搜索物品失败，请稍后重试。');
    }
  }
  
  Future<void> _onShowItemDetail(ShowItemDetail event, Emitter<ChatState> emit) async {
    _addBotMessage(
      '物品详情：',
      type: MessageType.itemDetail,
      selectedItem: event.item,
    );
  }
  
  Future<void> _onShowItemForm(ShowItemForm event, Emitter<ChatState> emit) async {
    _addBotMessage(
      event.item != null ? '编辑物品：' : '添加新物品：',
      type: MessageType.itemForm,
      selectedItem: event.item,
    );
  }
  
  void _onClearChat(ClearChat event, Emitter<ChatState> emit) {
    _initializeChat();
  }
}
