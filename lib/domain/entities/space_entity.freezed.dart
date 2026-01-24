// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'space_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpaceEntity {
  String get id => throw _privateConstructorUsedError; // 空间唯一标识
  String get name => throw _privateConstructorUsedError; // 空间名称（如：我的家）
  List<RoomEntity> get rooms => throw _privateConstructorUsedError; // 房间列表
  String get description => throw _privateConstructorUsedError; // 空间描述
  double get scale => throw _privateConstructorUsedError; // 当前缩放比例
  double get offsetX => throw _privateConstructorUsedError; // 当前X偏移
  double get offsetY => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpaceEntityCopyWith<SpaceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceEntityCopyWith<$Res> {
  factory $SpaceEntityCopyWith(
          SpaceEntity value, $Res Function(SpaceEntity) then) =
      _$SpaceEntityCopyWithImpl<$Res, SpaceEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<RoomEntity> rooms,
      String description,
      double scale,
      double offsetX,
      double offsetY});
}

/// @nodoc
class _$SpaceEntityCopyWithImpl<$Res, $Val extends SpaceEntity>
    implements $SpaceEntityCopyWith<$Res> {
  _$SpaceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rooms = null,
    Object? description = null,
    Object? scale = null,
    Object? offsetX = null,
    Object? offsetY = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomEntity>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpaceEntityImplCopyWith<$Res>
    implements $SpaceEntityCopyWith<$Res> {
  factory _$$SpaceEntityImplCopyWith(
          _$SpaceEntityImpl value, $Res Function(_$SpaceEntityImpl) then) =
      __$$SpaceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<RoomEntity> rooms,
      String description,
      double scale,
      double offsetX,
      double offsetY});
}

/// @nodoc
class __$$SpaceEntityImplCopyWithImpl<$Res>
    extends _$SpaceEntityCopyWithImpl<$Res, _$SpaceEntityImpl>
    implements _$$SpaceEntityImplCopyWith<$Res> {
  __$$SpaceEntityImplCopyWithImpl(
      _$SpaceEntityImpl _value, $Res Function(_$SpaceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rooms = null,
    Object? description = null,
    Object? scale = null,
    Object? offsetX = null,
    Object? offsetY = null,
  }) {
    return _then(_$SpaceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomEntity>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$SpaceEntityImpl implements _SpaceEntity {
  const _$SpaceEntityImpl(
      {required this.id,
      required this.name,
      required final List<RoomEntity> rooms,
      required this.description,
      this.scale = 0,
      this.offsetX = 0,
      this.offsetY = 0})
      : _rooms = rooms;

  @override
  final String id;
// 空间唯一标识
  @override
  final String name;
// 空间名称（如：我的家）
  final List<RoomEntity> _rooms;
// 空间名称（如：我的家）
  @override
  List<RoomEntity> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

// 房间列表
  @override
  final String description;
// 空间描述
  @override
  @JsonKey()
  final double scale;
// 当前缩放比例
  @override
  @JsonKey()
  final double offsetX;
// 当前X偏移
  @override
  @JsonKey()
  final double offsetY;

  @override
  String toString() {
    return 'SpaceEntity(id: $id, name: $name, rooms: $rooms, description: $description, scale: $scale, offsetX: $offsetX, offsetY: $offsetY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_rooms),
      description,
      scale,
      offsetX,
      offsetY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpaceEntityImplCopyWith<_$SpaceEntityImpl> get copyWith =>
      __$$SpaceEntityImplCopyWithImpl<_$SpaceEntityImpl>(this, _$identity);
}

abstract class _SpaceEntity implements SpaceEntity {
  const factory _SpaceEntity(
      {required final String id,
      required final String name,
      required final List<RoomEntity> rooms,
      required final String description,
      final double scale,
      final double offsetX,
      final double offsetY}) = _$SpaceEntityImpl;

  @override
  String get id;
  @override // 空间唯一标识
  String get name;
  @override // 空间名称（如：我的家）
  List<RoomEntity> get rooms;
  @override // 房间列表
  String get description;
  @override // 空间描述
  double get scale;
  @override // 当前缩放比例
  double get offsetX;
  @override // 当前X偏移
  double get offsetY;
  @override
  @JsonKey(ignore: true)
  _$$SpaceEntityImplCopyWith<_$SpaceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
