import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/item_entity.dart';

part 'chat_event.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.initialize() = Initialize;

  const factory ChatEvent.sendMessage({
    required String content,
  }) = SendMessage;
  
  const factory ChatEvent.sendImage({
    required String imagePath,
  }) = SendImage;
  
  const factory ChatEvent.sendScanResult({
    required String value,
    required String type,
  }) = SendScanResult;
  
  const factory ChatEvent.loadItems() = LoadItems;
  
  const factory ChatEvent.loadItemsByRoom({
    required String roomId,
  }) = LoadItemsByRoom;
  
  const factory ChatEvent.addItem({
    required ItemEntity item,
  }) = AddItem;
  
  const factory ChatEvent.updateItem({
    required ItemEntity item,
  }) = UpdateItem;
  
  const factory ChatEvent.deleteItem({
    required String itemId,
  }) = DeleteItem;
  
  const factory ChatEvent.searchItems({
    required String query,
  }) = SearchItems;
  
  const factory ChatEvent.showItemDetail({
    required ItemEntity item,
  }) = ShowItemDetail;
  
  const factory ChatEvent.showItemForm({
    ItemEntity? item,
    String? roomId,
  }) = ShowItemForm;
  
  const factory ChatEvent.clearChat() = ClearChat;
  
  const factory ChatEvent.startSpeechRecognition() = StartSpeechRecognition;
  
  const factory ChatEvent.stopSpeechRecognition() = StopSpeechRecognition;
  
  const factory ChatEvent.speakMessage({
    required String message,
  }) = SpeakMessage;
  
  const factory ChatEvent.stopSpeaking() = StopSpeaking;
}
