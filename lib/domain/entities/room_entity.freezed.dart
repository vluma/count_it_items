// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomEntity {
  String get id => throw _privateConstructorUsedError; // 房间唯一标识
  String get name => throw _privateConstructorUsedError; // 房间名称
  String get type => throw _privateConstructorUsedError; // 房间类型（卧室、厨房等）
  List<Offset> get points => throw _privateConstructorUsedError; // 房间多边形坐标点
  int get itemCount => throw _privateConstructorUsedError; // 物品数量
  SpaceLoadStatus get load => throw _privateConstructorUsedError; // 装载状态
  Offset get centerPoint => throw _privateConstructorUsedError; // 预计算的中心点
  bool get isSelected => throw _privateConstructorUsedError; // 是否被选中
  bool get isHighlighted => throw _privateConstructorUsedError; // 是否被高亮
  bool get isLocked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomEntityCopyWith<RoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEntityCopyWith<$Res> {
  factory $RoomEntityCopyWith(
          RoomEntity value, $Res Function(RoomEntity) then) =
      _$RoomEntityCopyWithImpl<$Res, RoomEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<Offset> points,
      int itemCount,
      SpaceLoadStatus load,
      Offset centerPoint,
      bool isSelected,
      bool isHighlighted,
      bool isLocked});
}

/// @nodoc
class _$RoomEntityCopyWithImpl<$Res, $Val extends RoomEntity>
    implements $RoomEntityCopyWith<$Res> {
  _$RoomEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? points = null,
    Object? itemCount = null,
    Object? load = null,
    Object? centerPoint = null,
    Object? isSelected = null,
    Object? isHighlighted = null,
    Object? isLocked = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as SpaceLoadStatus,
      centerPoint: null == centerPoint
          ? _value.centerPoint
          : centerPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isHighlighted: null == isHighlighted
          ? _value.isHighlighted
          : isHighlighted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomEntityImplCopyWith<$Res>
    implements $RoomEntityCopyWith<$Res> {
  factory _$$RoomEntityImplCopyWith(
          _$RoomEntityImpl value, $Res Function(_$RoomEntityImpl) then) =
      __$$RoomEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<Offset> points,
      int itemCount,
      SpaceLoadStatus load,
      Offset centerPoint,
      bool isSelected,
      bool isHighlighted,
      bool isLocked});
}

/// @nodoc
class __$$RoomEntityImplCopyWithImpl<$Res>
    extends _$RoomEntityCopyWithImpl<$Res, _$RoomEntityImpl>
    implements _$$RoomEntityImplCopyWith<$Res> {
  __$$RoomEntityImplCopyWithImpl(
      _$RoomEntityImpl _value, $Res Function(_$RoomEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? points = null,
    Object? itemCount = null,
    Object? load = null,
    Object? centerPoint = null,
    Object? isSelected = null,
    Object? isHighlighted = null,
    Object? isLocked = null,
  }) {
    return _then(_$RoomEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as SpaceLoadStatus,
      centerPoint: null == centerPoint
          ? _value.centerPoint
          : centerPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isHighlighted: null == isHighlighted
          ? _value.isHighlighted
          : isHighlighted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RoomEntityImpl implements _RoomEntity {
  const _$RoomEntityImpl(
      {required this.id,
      required this.name,
      required this.type,
      required final List<Offset> points,
      required this.itemCount,
      required this.load,
      this.centerPoint = Offset.zero,
      this.isSelected = false,
      this.isHighlighted = false,
      this.isLocked = true})
      : _points = points;

  @override
  final String id;
// 房间唯一标识
  @override
  final String name;
// 房间名称
  @override
  final String type;
// 房间类型（卧室、厨房等）
  final List<Offset> _points;
// 房间类型（卧室、厨房等）
  @override
  List<Offset> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

// 房间多边形坐标点
  @override
  final int itemCount;
// 物品数量
  @override
  final SpaceLoadStatus load;
// 装载状态
  @override
  @JsonKey()
  final Offset centerPoint;
// 预计算的中心点
  @override
  @JsonKey()
  final bool isSelected;
// 是否被选中
  @override
  @JsonKey()
  final bool isHighlighted;
// 是否被高亮
  @override
  @JsonKey()
  final bool isLocked;

  @override
  String toString() {
    return 'RoomEntity(id: $id, name: $name, type: $type, points: $points, itemCount: $itemCount, load: $load, centerPoint: $centerPoint, isSelected: $isSelected, isHighlighted: $isHighlighted, isLocked: $isLocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.centerPoint, centerPoint) ||
                other.centerPoint == centerPoint) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isHighlighted, isHighlighted) ||
                other.isHighlighted == isHighlighted) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_points),
      itemCount,
      load,
      centerPoint,
      isSelected,
      isHighlighted,
      isLocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      __$$RoomEntityImplCopyWithImpl<_$RoomEntityImpl>(this, _$identity);
}

abstract class _RoomEntity implements RoomEntity {
  const factory _RoomEntity(
      {required final String id,
      required final String name,
      required final String type,
      required final List<Offset> points,
      required final int itemCount,
      required final SpaceLoadStatus load,
      final Offset centerPoint,
      final bool isSelected,
      final bool isHighlighted,
      final bool isLocked}) = _$RoomEntityImpl;

  @override
  String get id;
  @override // 房间唯一标识
  String get name;
  @override // 房间名称
  String get type;
  @override // 房间类型（卧室、厨房等）
  List<Offset> get points;
  @override // 房间多边形坐标点
  int get itemCount;
  @override // 物品数量
  SpaceLoadStatus get load;
  @override // 装载状态
  Offset get centerPoint;
  @override // 预计算的中心点
  bool get isSelected;
  @override // 是否被选中
  bool get isHighlighted;
  @override // 是否被高亮
  bool get isLocked;
  @override
  @JsonKey(ignore: true)
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
