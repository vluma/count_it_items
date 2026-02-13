// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$SendMessageImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements SendMessage {
  const _$SendMessageImpl({required this.content});

  @override
  final String content;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return sendMessage(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return sendMessage?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements ChatEvent {
  const factory SendMessage({required final String content}) =
      _$SendMessageImpl;

  String get content;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadItemsImplCopyWith<$Res> {
  factory _$$LoadItemsImplCopyWith(
          _$LoadItemsImpl value, $Res Function(_$LoadItemsImpl) then) =
      __$$LoadItemsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadItemsImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadItemsImpl>
    implements _$$LoadItemsImplCopyWith<$Res> {
  __$$LoadItemsImplCopyWithImpl(
      _$LoadItemsImpl _value, $Res Function(_$LoadItemsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadItemsImpl implements LoadItems {
  const _$LoadItemsImpl();

  @override
  String toString() {
    return 'ChatEvent.loadItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadItemsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return loadItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return loadItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (loadItems != null) {
      return loadItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return loadItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return loadItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (loadItems != null) {
      return loadItems(this);
    }
    return orElse();
  }
}

abstract class LoadItems implements ChatEvent {
  const factory LoadItems() = _$LoadItemsImpl;
}

/// @nodoc
abstract class _$$LoadItemsByRoomImplCopyWith<$Res> {
  factory _$$LoadItemsByRoomImplCopyWith(_$LoadItemsByRoomImpl value,
          $Res Function(_$LoadItemsByRoomImpl) then) =
      __$$LoadItemsByRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$LoadItemsByRoomImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadItemsByRoomImpl>
    implements _$$LoadItemsByRoomImplCopyWith<$Res> {
  __$$LoadItemsByRoomImplCopyWithImpl(
      _$LoadItemsByRoomImpl _value, $Res Function(_$LoadItemsByRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$LoadItemsByRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadItemsByRoomImpl implements LoadItemsByRoom {
  const _$LoadItemsByRoomImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'ChatEvent.loadItemsByRoom(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadItemsByRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadItemsByRoomImplCopyWith<_$LoadItemsByRoomImpl> get copyWith =>
      __$$LoadItemsByRoomImplCopyWithImpl<_$LoadItemsByRoomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return loadItemsByRoom(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return loadItemsByRoom?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (loadItemsByRoom != null) {
      return loadItemsByRoom(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return loadItemsByRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return loadItemsByRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (loadItemsByRoom != null) {
      return loadItemsByRoom(this);
    }
    return orElse();
  }
}

abstract class LoadItemsByRoom implements ChatEvent {
  const factory LoadItemsByRoom({required final String roomId}) =
      _$LoadItemsByRoomImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$LoadItemsByRoomImplCopyWith<_$LoadItemsByRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemImplCopyWith<$Res> {
  factory _$$AddItemImplCopyWith(
          _$AddItemImpl value, $Res Function(_$AddItemImpl) then) =
      __$$AddItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemEntity item});

  $ItemEntityCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$AddItemImpl>
    implements _$$AddItemImplCopyWith<$Res> {
  __$$AddItemImplCopyWithImpl(
      _$AddItemImpl _value, $Res Function(_$AddItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemEntityCopyWith<$Res> get item {
    return $ItemEntityCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddItemImpl implements AddItem {
  const _$AddItemImpl({required this.item});

  @override
  final ItemEntity item;

  @override
  String toString() {
    return 'ChatEvent.addItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      __$$AddItemImplCopyWithImpl<_$AddItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return addItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return addItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class AddItem implements ChatEvent {
  const factory AddItem({required final ItemEntity item}) = _$AddItemImpl;

  ItemEntity get item;
  @JsonKey(ignore: true)
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemImplCopyWith<$Res> {
  factory _$$UpdateItemImplCopyWith(
          _$UpdateItemImpl value, $Res Function(_$UpdateItemImpl) then) =
      __$$UpdateItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemEntity item});

  $ItemEntityCopyWith<$Res> get item;
}

/// @nodoc
class __$$UpdateItemImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$UpdateItemImpl>
    implements _$$UpdateItemImplCopyWith<$Res> {
  __$$UpdateItemImplCopyWithImpl(
      _$UpdateItemImpl _value, $Res Function(_$UpdateItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$UpdateItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemEntityCopyWith<$Res> get item {
    return $ItemEntityCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$UpdateItemImpl implements UpdateItem {
  const _$UpdateItemImpl({required this.item});

  @override
  final ItemEntity item;

  @override
  String toString() {
    return 'ChatEvent.updateItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemImplCopyWith<_$UpdateItemImpl> get copyWith =>
      __$$UpdateItemImplCopyWithImpl<_$UpdateItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return updateItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return updateItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return updateItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return updateItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(this);
    }
    return orElse();
  }
}

abstract class UpdateItem implements ChatEvent {
  const factory UpdateItem({required final ItemEntity item}) = _$UpdateItemImpl;

  ItemEntity get item;
  @JsonKey(ignore: true)
  _$$UpdateItemImplCopyWith<_$UpdateItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteItemImplCopyWith<$Res> {
  factory _$$DeleteItemImplCopyWith(
          _$DeleteItemImpl value, $Res Function(_$DeleteItemImpl) then) =
      __$$DeleteItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId});
}

/// @nodoc
class __$$DeleteItemImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$DeleteItemImpl>
    implements _$$DeleteItemImplCopyWith<$Res> {
  __$$DeleteItemImplCopyWithImpl(
      _$DeleteItemImpl _value, $Res Function(_$DeleteItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$DeleteItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteItemImpl implements DeleteItem {
  const _$DeleteItemImpl({required this.itemId});

  @override
  final String itemId;

  @override
  String toString() {
    return 'ChatEvent.deleteItem(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      __$$DeleteItemImplCopyWithImpl<_$DeleteItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return deleteItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return deleteItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class DeleteItem implements ChatEvent {
  const factory DeleteItem({required final String itemId}) = _$DeleteItemImpl;

  String get itemId;
  @JsonKey(ignore: true)
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchItemsImplCopyWith<$Res> {
  factory _$$SearchItemsImplCopyWith(
          _$SearchItemsImpl value, $Res Function(_$SearchItemsImpl) then) =
      __$$SearchItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchItemsImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SearchItemsImpl>
    implements _$$SearchItemsImplCopyWith<$Res> {
  __$$SearchItemsImplCopyWithImpl(
      _$SearchItemsImpl _value, $Res Function(_$SearchItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchItemsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchItemsImpl implements SearchItems {
  const _$SearchItemsImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ChatEvent.searchItems(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemsImplCopyWith<_$SearchItemsImpl> get copyWith =>
      __$$SearchItemsImplCopyWithImpl<_$SearchItemsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return searchItems(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return searchItems?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (searchItems != null) {
      return searchItems(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return searchItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return searchItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (searchItems != null) {
      return searchItems(this);
    }
    return orElse();
  }
}

abstract class SearchItems implements ChatEvent {
  const factory SearchItems({required final String query}) = _$SearchItemsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchItemsImplCopyWith<_$SearchItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowItemDetailImplCopyWith<$Res> {
  factory _$$ShowItemDetailImplCopyWith(_$ShowItemDetailImpl value,
          $Res Function(_$ShowItemDetailImpl) then) =
      __$$ShowItemDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemEntity item});

  $ItemEntityCopyWith<$Res> get item;
}

/// @nodoc
class __$$ShowItemDetailImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ShowItemDetailImpl>
    implements _$$ShowItemDetailImplCopyWith<$Res> {
  __$$ShowItemDetailImplCopyWithImpl(
      _$ShowItemDetailImpl _value, $Res Function(_$ShowItemDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$ShowItemDetailImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemEntityCopyWith<$Res> get item {
    return $ItemEntityCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ShowItemDetailImpl implements ShowItemDetail {
  const _$ShowItemDetailImpl({required this.item});

  @override
  final ItemEntity item;

  @override
  String toString() {
    return 'ChatEvent.showItemDetail(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowItemDetailImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowItemDetailImplCopyWith<_$ShowItemDetailImpl> get copyWith =>
      __$$ShowItemDetailImplCopyWithImpl<_$ShowItemDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return showItemDetail(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return showItemDetail?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (showItemDetail != null) {
      return showItemDetail(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return showItemDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return showItemDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (showItemDetail != null) {
      return showItemDetail(this);
    }
    return orElse();
  }
}

abstract class ShowItemDetail implements ChatEvent {
  const factory ShowItemDetail({required final ItemEntity item}) =
      _$ShowItemDetailImpl;

  ItemEntity get item;
  @JsonKey(ignore: true)
  _$$ShowItemDetailImplCopyWith<_$ShowItemDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowItemFormImplCopyWith<$Res> {
  factory _$$ShowItemFormImplCopyWith(
          _$ShowItemFormImpl value, $Res Function(_$ShowItemFormImpl) then) =
      __$$ShowItemFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemEntity? item, String? roomId});

  $ItemEntityCopyWith<$Res>? get item;
}

/// @nodoc
class __$$ShowItemFormImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ShowItemFormImpl>
    implements _$$ShowItemFormImplCopyWith<$Res> {
  __$$ShowItemFormImplCopyWithImpl(
      _$ShowItemFormImpl _value, $Res Function(_$ShowItemFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? roomId = freezed,
  }) {
    return _then(_$ShowItemFormImpl(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemEntity?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemEntityCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemEntityCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ShowItemFormImpl implements ShowItemForm {
  const _$ShowItemFormImpl({this.item, this.roomId});

  @override
  final ItemEntity? item;
  @override
  final String? roomId;

  @override
  String toString() {
    return 'ChatEvent.showItemForm(item: $item, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowItemFormImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowItemFormImplCopyWith<_$ShowItemFormImpl> get copyWith =>
      __$$ShowItemFormImplCopyWithImpl<_$ShowItemFormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return showItemForm(item, roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return showItemForm?.call(item, roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (showItemForm != null) {
      return showItemForm(item, roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return showItemForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return showItemForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (showItemForm != null) {
      return showItemForm(this);
    }
    return orElse();
  }
}

abstract class ShowItemForm implements ChatEvent {
  const factory ShowItemForm({final ItemEntity? item, final String? roomId}) =
      _$ShowItemFormImpl;

  ItemEntity? get item;
  String? get roomId;
  @JsonKey(ignore: true)
  _$$ShowItemFormImplCopyWith<_$ShowItemFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearChatImplCopyWith<$Res> {
  factory _$$ClearChatImplCopyWith(
          _$ClearChatImpl value, $Res Function(_$ClearChatImpl) then) =
      __$$ClearChatImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ClearChatImpl>
    implements _$$ClearChatImplCopyWith<$Res> {
  __$$ClearChatImplCopyWithImpl(
      _$ClearChatImpl _value, $Res Function(_$ClearChatImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearChatImpl implements ClearChat {
  const _$ClearChatImpl();

  @override
  String toString() {
    return 'ChatEvent.clearChat()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearChatImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function() loadItems,
    required TResult Function(String roomId) loadItemsByRoom,
    required TResult Function(ItemEntity item) addItem,
    required TResult Function(ItemEntity item) updateItem,
    required TResult Function(String itemId) deleteItem,
    required TResult Function(String query) searchItems,
    required TResult Function(ItemEntity item) showItemDetail,
    required TResult Function(ItemEntity? item, String? roomId) showItemForm,
    required TResult Function() clearChat,
  }) {
    return clearChat();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function()? loadItems,
    TResult? Function(String roomId)? loadItemsByRoom,
    TResult? Function(ItemEntity item)? addItem,
    TResult? Function(ItemEntity item)? updateItem,
    TResult? Function(String itemId)? deleteItem,
    TResult? Function(String query)? searchItems,
    TResult? Function(ItemEntity item)? showItemDetail,
    TResult? Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult? Function()? clearChat,
  }) {
    return clearChat?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function()? loadItems,
    TResult Function(String roomId)? loadItemsByRoom,
    TResult Function(ItemEntity item)? addItem,
    TResult Function(ItemEntity item)? updateItem,
    TResult Function(String itemId)? deleteItem,
    TResult Function(String query)? searchItems,
    TResult Function(ItemEntity item)? showItemDetail,
    TResult Function(ItemEntity? item, String? roomId)? showItemForm,
    TResult Function()? clearChat,
    required TResult orElse(),
  }) {
    if (clearChat != null) {
      return clearChat();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(LoadItems value) loadItems,
    required TResult Function(LoadItemsByRoom value) loadItemsByRoom,
    required TResult Function(AddItem value) addItem,
    required TResult Function(UpdateItem value) updateItem,
    required TResult Function(DeleteItem value) deleteItem,
    required TResult Function(SearchItems value) searchItems,
    required TResult Function(ShowItemDetail value) showItemDetail,
    required TResult Function(ShowItemForm value) showItemForm,
    required TResult Function(ClearChat value) clearChat,
  }) {
    return clearChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(LoadItems value)? loadItems,
    TResult? Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult? Function(AddItem value)? addItem,
    TResult? Function(UpdateItem value)? updateItem,
    TResult? Function(DeleteItem value)? deleteItem,
    TResult? Function(SearchItems value)? searchItems,
    TResult? Function(ShowItemDetail value)? showItemDetail,
    TResult? Function(ShowItemForm value)? showItemForm,
    TResult? Function(ClearChat value)? clearChat,
  }) {
    return clearChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(LoadItems value)? loadItems,
    TResult Function(LoadItemsByRoom value)? loadItemsByRoom,
    TResult Function(AddItem value)? addItem,
    TResult Function(UpdateItem value)? updateItem,
    TResult Function(DeleteItem value)? deleteItem,
    TResult Function(SearchItems value)? searchItems,
    TResult Function(ShowItemDetail value)? showItemDetail,
    TResult Function(ShowItemForm value)? showItemForm,
    TResult Function(ClearChat value)? clearChat,
    required TResult orElse(),
  }) {
    if (clearChat != null) {
      return clearChat(this);
    }
    return orElse();
  }
}

abstract class ClearChat implements ChatEvent {
  const factory ClearChat() = _$ClearChatImpl;
}
