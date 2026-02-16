// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res, MapEvent>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res, $Val extends MapEvent>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadMapImplCopyWith<$Res> {
  factory _$$LoadMapImplCopyWith(
          _$LoadMapImpl value, $Res Function(_$LoadMapImpl) then) =
      __$$LoadMapImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMapImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$LoadMapImpl>
    implements _$$LoadMapImplCopyWith<$Res> {
  __$$LoadMapImplCopyWithImpl(
      _$LoadMapImpl _value, $Res Function(_$LoadMapImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMapImpl implements LoadMap {
  const _$LoadMapImpl();

  @override
  String toString() {
    return 'MapEvent.loadMap()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMapImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return loadMap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return loadMap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (loadMap != null) {
      return loadMap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return loadMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return loadMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (loadMap != null) {
      return loadMap(this);
    }
    return orElse();
  }
}

abstract class LoadMap implements MapEvent {
  const factory LoadMap() = _$LoadMapImpl;
}

/// @nodoc
abstract class _$$SelectRoomImplCopyWith<$Res> {
  factory _$$SelectRoomImplCopyWith(
          _$SelectRoomImpl value, $Res Function(_$SelectRoomImpl) then) =
      __$$SelectRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$SelectRoomImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SelectRoomImpl>
    implements _$$SelectRoomImplCopyWith<$Res> {
  __$$SelectRoomImplCopyWithImpl(
      _$SelectRoomImpl _value, $Res Function(_$SelectRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$SelectRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectRoomImpl implements SelectRoom {
  const _$SelectRoomImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'MapEvent.selectRoom(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectRoomImplCopyWith<_$SelectRoomImpl> get copyWith =>
      __$$SelectRoomImplCopyWithImpl<_$SelectRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return selectRoom(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return selectRoom?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (selectRoom != null) {
      return selectRoom(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return selectRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return selectRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (selectRoom != null) {
      return selectRoom(this);
    }
    return orElse();
  }
}

abstract class SelectRoom implements MapEvent {
  const factory SelectRoom({required final String roomId}) = _$SelectRoomImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$SelectRoomImplCopyWith<_$SelectRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeselectRoomImplCopyWith<$Res> {
  factory _$$DeselectRoomImplCopyWith(
          _$DeselectRoomImpl value, $Res Function(_$DeselectRoomImpl) then) =
      __$$DeselectRoomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeselectRoomImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$DeselectRoomImpl>
    implements _$$DeselectRoomImplCopyWith<$Res> {
  __$$DeselectRoomImplCopyWithImpl(
      _$DeselectRoomImpl _value, $Res Function(_$DeselectRoomImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeselectRoomImpl implements DeselectRoom {
  const _$DeselectRoomImpl();

  @override
  String toString() {
    return 'MapEvent.deselectRoom()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeselectRoomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return deselectRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return deselectRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (deselectRoom != null) {
      return deselectRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return deselectRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return deselectRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (deselectRoom != null) {
      return deselectRoom(this);
    }
    return orElse();
  }
}

abstract class DeselectRoom implements MapEvent {
  const factory DeselectRoom() = _$DeselectRoomImpl;
}

/// @nodoc
abstract class _$$ToggleOverlayImplCopyWith<$Res> {
  factory _$$ToggleOverlayImplCopyWith(
          _$ToggleOverlayImpl value, $Res Function(_$ToggleOverlayImpl) then) =
      __$$ToggleOverlayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleOverlayImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ToggleOverlayImpl>
    implements _$$ToggleOverlayImplCopyWith<$Res> {
  __$$ToggleOverlayImplCopyWithImpl(
      _$ToggleOverlayImpl _value, $Res Function(_$ToggleOverlayImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleOverlayImpl implements ToggleOverlay {
  const _$ToggleOverlayImpl();

  @override
  String toString() {
    return 'MapEvent.toggleOverlay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleOverlayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return toggleOverlay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return toggleOverlay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (toggleOverlay != null) {
      return toggleOverlay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return toggleOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return toggleOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (toggleOverlay != null) {
      return toggleOverlay(this);
    }
    return orElse();
  }
}

abstract class ToggleOverlay implements MapEvent {
  const factory ToggleOverlay() = _$ToggleOverlayImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements Search {
  const _$SearchImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'MapEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements MapEvent {
  const factory Search({required final String query}) = _$SearchImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'MapEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class ClearSearch implements MapEvent {
  const factory ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$UpdateTransformImplCopyWith<$Res> {
  factory _$$UpdateTransformImplCopyWith(_$UpdateTransformImpl value,
          $Res Function(_$UpdateTransformImpl) then) =
      __$$UpdateTransformImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double scale, double offsetX, double offsetY});
}

/// @nodoc
class __$$UpdateTransformImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$UpdateTransformImpl>
    implements _$$UpdateTransformImplCopyWith<$Res> {
  __$$UpdateTransformImplCopyWithImpl(
      _$UpdateTransformImpl _value, $Res Function(_$UpdateTransformImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? offsetX = null,
    Object? offsetY = null,
  }) {
    return _then(_$UpdateTransformImpl(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateTransformImpl implements UpdateTransform {
  const _$UpdateTransformImpl(
      {required this.scale, required this.offsetX, required this.offsetY});

  @override
  final double scale;
  @override
  final double offsetX;
  @override
  final double offsetY;

  @override
  String toString() {
    return 'MapEvent.updateTransform(scale: $scale, offsetX: $offsetX, offsetY: $offsetY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransformImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scale, offsetX, offsetY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransformImplCopyWith<_$UpdateTransformImpl> get copyWith =>
      __$$UpdateTransformImplCopyWithImpl<_$UpdateTransformImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return updateTransform(scale, offsetX, offsetY);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return updateTransform?.call(scale, offsetX, offsetY);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateTransform != null) {
      return updateTransform(scale, offsetX, offsetY);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return updateTransform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return updateTransform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateTransform != null) {
      return updateTransform(this);
    }
    return orElse();
  }
}

abstract class UpdateTransform implements MapEvent {
  const factory UpdateTransform(
      {required final double scale,
      required final double offsetX,
      required final double offsetY}) = _$UpdateTransformImpl;

  double get scale;
  double get offsetX;
  double get offsetY;
  @JsonKey(ignore: true)
  _$$UpdateTransformImplCopyWith<_$UpdateTransformImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoubleTapEmptyImplCopyWith<$Res> {
  factory _$$DoubleTapEmptyImplCopyWith(_$DoubleTapEmptyImpl value,
          $Res Function(_$DoubleTapEmptyImpl) then) =
      __$$DoubleTapEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoubleTapEmptyImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$DoubleTapEmptyImpl>
    implements _$$DoubleTapEmptyImplCopyWith<$Res> {
  __$$DoubleTapEmptyImplCopyWithImpl(
      _$DoubleTapEmptyImpl _value, $Res Function(_$DoubleTapEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DoubleTapEmptyImpl implements DoubleTapEmpty {
  const _$DoubleTapEmptyImpl();

  @override
  String toString() {
    return 'MapEvent.doubleTapEmpty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoubleTapEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return doubleTapEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return doubleTapEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (doubleTapEmpty != null) {
      return doubleTapEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return doubleTapEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return doubleTapEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (doubleTapEmpty != null) {
      return doubleTapEmpty(this);
    }
    return orElse();
  }
}

abstract class DoubleTapEmpty implements MapEvent {
  const factory DoubleTapEmpty() = _$DoubleTapEmptyImpl;
}

/// @nodoc
abstract class _$$AddRoomImplCopyWith<$Res> {
  factory _$$AddRoomImplCopyWith(
          _$AddRoomImpl value, $Res Function(_$AddRoomImpl) then) =
      __$$AddRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$AddRoomImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$AddRoomImpl>
    implements _$$AddRoomImplCopyWith<$Res> {
  __$$AddRoomImplCopyWithImpl(
      _$AddRoomImpl _value, $Res Function(_$AddRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$AddRoomImpl(
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

class _$AddRoomImpl implements AddRoom {
  const _$AddRoomImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'MapEvent.addRoom(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRoomImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRoomImplCopyWith<_$AddRoomImpl> get copyWith =>
      __$$AddRoomImplCopyWithImpl<_$AddRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return addRoom(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return addRoom?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (addRoom != null) {
      return addRoom(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return addRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return addRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (addRoom != null) {
      return addRoom(this);
    }
    return orElse();
  }
}

abstract class AddRoom implements MapEvent {
  const factory AddRoom({required final RoomEntity room}) = _$AddRoomImpl;

  RoomEntity get room;
  @JsonKey(ignore: true)
  _$$AddRoomImplCopyWith<_$AddRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRoomImplCopyWith<$Res> {
  factory _$$UpdateRoomImplCopyWith(
          _$UpdateRoomImpl value, $Res Function(_$UpdateRoomImpl) then) =
      __$$UpdateRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$UpdateRoomImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$UpdateRoomImpl>
    implements _$$UpdateRoomImplCopyWith<$Res> {
  __$$UpdateRoomImplCopyWithImpl(
      _$UpdateRoomImpl _value, $Res Function(_$UpdateRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$UpdateRoomImpl(
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

class _$UpdateRoomImpl implements UpdateRoom {
  const _$UpdateRoomImpl({required this.room});

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'MapEvent.updateRoom(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoomImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoomImplCopyWith<_$UpdateRoomImpl> get copyWith =>
      __$$UpdateRoomImplCopyWithImpl<_$UpdateRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return updateRoom(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return updateRoom?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateRoom != null) {
      return updateRoom(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return updateRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return updateRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateRoom != null) {
      return updateRoom(this);
    }
    return orElse();
  }
}

abstract class UpdateRoom implements MapEvent {
  const factory UpdateRoom({required final RoomEntity room}) = _$UpdateRoomImpl;

  RoomEntity get room;
  @JsonKey(ignore: true)
  _$$UpdateRoomImplCopyWith<_$UpdateRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRoomImplCopyWith<$Res> {
  factory _$$DeleteRoomImplCopyWith(
          _$DeleteRoomImpl value, $Res Function(_$DeleteRoomImpl) then) =
      __$$DeleteRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$DeleteRoomImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$DeleteRoomImpl>
    implements _$$DeleteRoomImplCopyWith<$Res> {
  __$$DeleteRoomImplCopyWithImpl(
      _$DeleteRoomImpl _value, $Res Function(_$DeleteRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$DeleteRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteRoomImpl implements DeleteRoom {
  const _$DeleteRoomImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'MapEvent.deleteRoom(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRoomImplCopyWith<_$DeleteRoomImpl> get copyWith =>
      __$$DeleteRoomImplCopyWithImpl<_$DeleteRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return deleteRoom(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return deleteRoom?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (deleteRoom != null) {
      return deleteRoom(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return deleteRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return deleteRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (deleteRoom != null) {
      return deleteRoom(this);
    }
    return orElse();
  }
}

abstract class DeleteRoom implements MapEvent {
  const factory DeleteRoom({required final String roomId}) = _$DeleteRoomImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$DeleteRoomImplCopyWith<_$DeleteRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRoomPointsImplCopyWith<$Res> {
  factory _$$UpdateRoomPointsImplCopyWith(_$UpdateRoomPointsImpl value,
          $Res Function(_$UpdateRoomPointsImpl) then) =
      __$$UpdateRoomPointsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, List<Offset> points});
}

/// @nodoc
class __$$UpdateRoomPointsImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$UpdateRoomPointsImpl>
    implements _$$UpdateRoomPointsImplCopyWith<$Res> {
  __$$UpdateRoomPointsImplCopyWithImpl(_$UpdateRoomPointsImpl _value,
      $Res Function(_$UpdateRoomPointsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? points = null,
  }) {
    return _then(_$UpdateRoomPointsImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
    ));
  }
}

/// @nodoc

class _$UpdateRoomPointsImpl implements UpdateRoomPoints {
  const _$UpdateRoomPointsImpl(
      {required this.roomId, required final List<Offset> points})
      : _points = points;

  @override
  final String roomId;
  final List<Offset> _points;
  @override
  List<Offset> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'MapEvent.updateRoomPoints(roomId: $roomId, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoomPointsImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, roomId, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoomPointsImplCopyWith<_$UpdateRoomPointsImpl> get copyWith =>
      __$$UpdateRoomPointsImplCopyWithImpl<_$UpdateRoomPointsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return updateRoomPoints(roomId, points);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return updateRoomPoints?.call(roomId, points);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateRoomPoints != null) {
      return updateRoomPoints(roomId, points);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return updateRoomPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return updateRoomPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (updateRoomPoints != null) {
      return updateRoomPoints(this);
    }
    return orElse();
  }
}

abstract class UpdateRoomPoints implements MapEvent {
  const factory UpdateRoomPoints(
      {required final String roomId,
      required final List<Offset> points}) = _$UpdateRoomPointsImpl;

  String get roomId;
  List<Offset> get points;
  @JsonKey(ignore: true)
  _$$UpdateRoomPointsImplCopyWith<_$UpdateRoomPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleEditModeImplCopyWith<$Res> {
  factory _$$ToggleEditModeImplCopyWith(_$ToggleEditModeImpl value,
          $Res Function(_$ToggleEditModeImpl) then) =
      __$$ToggleEditModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleEditModeImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ToggleEditModeImpl>
    implements _$$ToggleEditModeImplCopyWith<$Res> {
  __$$ToggleEditModeImplCopyWithImpl(
      _$ToggleEditModeImpl _value, $Res Function(_$ToggleEditModeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleEditModeImpl implements ToggleEditMode {
  const _$ToggleEditModeImpl();

  @override
  String toString() {
    return 'MapEvent.toggleEditMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleEditModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMap,
    required TResult Function(String roomId) selectRoom,
    required TResult Function() deselectRoom,
    required TResult Function() toggleOverlay,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(double scale, double offsetX, double offsetY)
        updateTransform,
    required TResult Function() doubleTapEmpty,
    required TResult Function(RoomEntity room) addRoom,
    required TResult Function(RoomEntity room) updateRoom,
    required TResult Function(String roomId) deleteRoom,
    required TResult Function(String roomId, List<Offset> points)
        updateRoomPoints,
    required TResult Function() toggleEditMode,
  }) {
    return toggleEditMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMap,
    TResult? Function(String roomId)? selectRoom,
    TResult? Function()? deselectRoom,
    TResult? Function()? toggleOverlay,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult? Function()? doubleTapEmpty,
    TResult? Function(RoomEntity room)? addRoom,
    TResult? Function(RoomEntity room)? updateRoom,
    TResult? Function(String roomId)? deleteRoom,
    TResult? Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult? Function()? toggleEditMode,
  }) {
    return toggleEditMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMap,
    TResult Function(String roomId)? selectRoom,
    TResult Function()? deselectRoom,
    TResult Function()? toggleOverlay,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(double scale, double offsetX, double offsetY)?
        updateTransform,
    TResult Function()? doubleTapEmpty,
    TResult Function(RoomEntity room)? addRoom,
    TResult Function(RoomEntity room)? updateRoom,
    TResult Function(String roomId)? deleteRoom,
    TResult Function(String roomId, List<Offset> points)? updateRoomPoints,
    TResult Function()? toggleEditMode,
    required TResult orElse(),
  }) {
    if (toggleEditMode != null) {
      return toggleEditMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMap value) loadMap,
    required TResult Function(SelectRoom value) selectRoom,
    required TResult Function(DeselectRoom value) deselectRoom,
    required TResult Function(ToggleOverlay value) toggleOverlay,
    required TResult Function(Search value) search,
    required TResult Function(ClearSearch value) clearSearch,
    required TResult Function(UpdateTransform value) updateTransform,
    required TResult Function(DoubleTapEmpty value) doubleTapEmpty,
    required TResult Function(AddRoom value) addRoom,
    required TResult Function(UpdateRoom value) updateRoom,
    required TResult Function(DeleteRoom value) deleteRoom,
    required TResult Function(UpdateRoomPoints value) updateRoomPoints,
    required TResult Function(ToggleEditMode value) toggleEditMode,
  }) {
    return toggleEditMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMap value)? loadMap,
    TResult? Function(SelectRoom value)? selectRoom,
    TResult? Function(DeselectRoom value)? deselectRoom,
    TResult? Function(ToggleOverlay value)? toggleOverlay,
    TResult? Function(Search value)? search,
    TResult? Function(ClearSearch value)? clearSearch,
    TResult? Function(UpdateTransform value)? updateTransform,
    TResult? Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult? Function(AddRoom value)? addRoom,
    TResult? Function(UpdateRoom value)? updateRoom,
    TResult? Function(DeleteRoom value)? deleteRoom,
    TResult? Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult? Function(ToggleEditMode value)? toggleEditMode,
  }) {
    return toggleEditMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMap value)? loadMap,
    TResult Function(SelectRoom value)? selectRoom,
    TResult Function(DeselectRoom value)? deselectRoom,
    TResult Function(ToggleOverlay value)? toggleOverlay,
    TResult Function(Search value)? search,
    TResult Function(ClearSearch value)? clearSearch,
    TResult Function(UpdateTransform value)? updateTransform,
    TResult Function(DoubleTapEmpty value)? doubleTapEmpty,
    TResult Function(AddRoom value)? addRoom,
    TResult Function(UpdateRoom value)? updateRoom,
    TResult Function(DeleteRoom value)? deleteRoom,
    TResult Function(UpdateRoomPoints value)? updateRoomPoints,
    TResult Function(ToggleEditMode value)? toggleEditMode,
    required TResult orElse(),
  }) {
    if (toggleEditMode != null) {
      return toggleEditMode(this);
    }
    return orElse();
  }
}

abstract class ToggleEditMode implements MapEvent {
  const factory ToggleEditMode() = _$ToggleEditModeImpl;
}
