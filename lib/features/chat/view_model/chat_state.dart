import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/item_entity.dart';

part 'chat_state.freezed.dart';

enum MessageType {
  text,
  itemList,
  itemDetail,
  itemForm,
  actionResult,
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String content,
    required bool isUser,
    required DateTime timestamp,
    @Default(MessageType.text) MessageType type,
    @Default([]) List<ItemEntity> items,
    ItemEntity? selectedItem,
    @Default('') String actionType,
  }) = _ChatMessage;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  
  const factory ChatState.loading() = _Loading;
  
  const factory ChatState.loaded({
    required List<ChatMessage> messages,
    @Default(false) bool isTyping,
  }) = _Loaded;
  
  const factory ChatState.error({
    required String message,
  }) = _Error;
}
