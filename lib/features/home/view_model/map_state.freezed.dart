// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MapState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MapState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MapState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SpaceEntity space,
      bool showOverlay,
      bool isSearching,
      List<ItemEntity> expiredItems,
      List<ItemEntity> expiringItems});

  $SpaceEntityCopyWith<$Res> get space;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? space = null,
    Object? showOverlay = null,
    Object? isSearching = null,
    Object? expiredItems = null,
    Object? expiringItems = null,
  }) {
    return _then(_$SuccessImpl(
      space: null == space
          ? _value.space
          : space // ignore: cast_nullable_to_non_nullable
              as SpaceEntity,
      showOverlay: null == showOverlay
          ? _value.showOverlay
          : showOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      expiredItems: null == expiredItems
          ? _value._expiredItems
          : expiredItems // ignore: cast_nullable_to_non_nullable
              as List<ItemEntity>,
      expiringItems: null == expiringItems
          ? _value._expiringItems
          : expiringItems // ignore: cast_nullable_to_non_nullable
              as List<ItemEntity>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SpaceEntityCopyWith<$Res> get space {
    return $SpaceEntityCopyWith<$Res>(_value.space, (value) {
      return _then(_value.copyWith(space: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required this.space,
      required this.showOverlay,
      required this.isSearching,
      final List<ItemEntity> expiredItems = const [],
      final List<ItemEntity> expiringItems = const []})
      : _expiredItems = expiredItems,
        _expiringItems = expiringItems;

  @override
  final SpaceEntity space;
  @override
  final bool showOverlay;
  @override
  final bool isSearching;
  final List<ItemEntity> _expiredItems;
  @override
  @JsonKey()
  List<ItemEntity> get expiredItems {
    if (_expiredItems is EqualUnmodifiableListView) return _expiredItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiredItems);
  }

  final List<ItemEntity> _expiringItems;
  @override
  @JsonKey()
  List<ItemEntity> get expiringItems {
    if (_expiringItems is EqualUnmodifiableListView) return _expiringItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiringItems);
  }

  @override
  String toString() {
    return 'MapState.success(space: $space, showOverlay: $showOverlay, isSearching: $isSearching, expiredItems: $expiredItems, expiringItems: $expiringItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.space, space) || other.space == space) &&
            (identical(other.showOverlay, showOverlay) ||
                other.showOverlay == showOverlay) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._expiredItems, _expiredItems) &&
            const DeepCollectionEquality()
                .equals(other._expiringItems, _expiringItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      space,
      showOverlay,
      isSearching,
      const DeepCollectionEquality().hash(_expiredItems),
      const DeepCollectionEquality().hash(_expiringItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return success(
        space, showOverlay, isSearching, expiredItems, expiringItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return success?.call(
        space, showOverlay, isSearching, expiredItems, expiringItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
          space, showOverlay, isSearching, expiredItems, expiringItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MapState {
  const factory _Success(
      {required final SpaceEntity space,
      required final bool showOverlay,
      required final bool isSearching,
      final List<ItemEntity> expiredItems,
      final List<ItemEntity> expiringItems}) = _$SuccessImpl;

  SpaceEntity get space;
  bool get showOverlay;
  bool get isSearching;
  List<ItemEntity> get expiredItems;
  List<ItemEntity> get expiringItems;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MapState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MapState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomSelectedImplCopyWith<$Res> {
  factory _$$RoomSelectedImplCopyWith(
          _$RoomSelectedImpl value, $Res Function(_$RoomSelectedImpl) then) =
      __$$RoomSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$RoomSelectedImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$RoomSelectedImpl>
    implements _$$RoomSelectedImplCopyWith<$Res> {
  __$$RoomSelectedImplCopyWithImpl(
      _$RoomSelectedImpl _value, $Res Function(_$RoomSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$RoomSelectedImpl(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get room {
    return $RoomEntityCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$RoomSelectedImpl implements _RoomSelected {
  const _$RoomSelectedImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'MapState.roomSelected(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomSelectedImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomSelectedImplCopyWith<_$RoomSelectedImpl> get copyWith =>
      __$$RoomSelectedImplCopyWithImpl<_$RoomSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return roomSelected(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return roomSelected?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (roomSelected != null) {
      return roomSelected(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return roomSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return roomSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (roomSelected != null) {
      return roomSelected(this);
    }
    return orElse();
  }
}

abstract class _RoomSelected implements MapState {
  const factory _RoomSelected({required final RoomEntity room}) =
      _$RoomSelectedImpl;

  RoomEntity get room;
  @JsonKey(ignore: true)
  _$$RoomSelectedImplCopyWith<_$RoomSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RoomEntity> results});
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$SearchResultImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<RoomEntity>,
    ));
  }
}

/// @nodoc

class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl({required final List<RoomEntity> results})
      : _results = results;

  final List<RoomEntity> _results;
  @override
  List<RoomEntity> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MapState.searchResult(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SpaceEntity space,
            bool showOverlay,
            bool isSearching,
            List<ItemEntity> expiredItems,
            List<ItemEntity> expiringItems)
        success,
    required TResult Function(String message) error,
    required TResult Function(RoomEntity room) roomSelected,
    required TResult Function(List<RoomEntity> results) searchResult,
  }) {
    return searchResult(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(RoomEntity room)? roomSelected,
    TResult? Function(List<RoomEntity> results)? searchResult,
  }) {
    return searchResult?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SpaceEntity space, bool showOverlay, bool isSearching,
            List<ItemEntity> expiredItems, List<ItemEntity> expiringItems)?
        success,
    TResult Function(String message)? error,
    TResult Function(RoomEntity room)? roomSelected,
    TResult Function(List<RoomEntity> results)? searchResult,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_RoomSelected value) roomSelected,
    required TResult Function(_SearchResult value) searchResult,
  }) {
    return searchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_RoomSelected value)? roomSelected,
    TResult? Function(_SearchResult value)? searchResult,
  }) {
    return searchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_RoomSelected value)? roomSelected,
    TResult Function(_SearchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(this);
    }
    return orElse();
  }
}

abstract class _SearchResult implements MapState {
  const factory _SearchResult({required final List<RoomEntity> results}) =
      _$SearchResultImpl;

  List<RoomEntity> get results;
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
