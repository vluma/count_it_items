// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  ItemCategory get category => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemEntityCopyWith<ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEntityCopyWith<$Res> {
  factory $ItemEntityCopyWith(
          ItemEntity value, $Res Function(ItemEntity) then) =
      _$ItemEntityCopyWithImpl<$Res, ItemEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String roomId,
      ItemCategory category,
      int quantity,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      bool isFavorite,
      DateTime? expirationDate});
}

/// @nodoc
class _$ItemEntityCopyWithImpl<$Res, $Val extends ItemEntity>
    implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roomId = null,
    Object? category = null,
    Object? quantity = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isFavorite = null,
    Object? expirationDate = freezed,
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
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEntityImplCopyWith<$Res>
    implements $ItemEntityCopyWith<$Res> {
  factory _$$ItemEntityImplCopyWith(
          _$ItemEntityImpl value, $Res Function(_$ItemEntityImpl) then) =
      __$$ItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String roomId,
      ItemCategory category,
      int quantity,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      bool isFavorite,
      DateTime? expirationDate});
}

/// @nodoc
class __$$ItemEntityImplCopyWithImpl<$Res>
    extends _$ItemEntityCopyWithImpl<$Res, _$ItemEntityImpl>
    implements _$$ItemEntityImplCopyWith<$Res> {
  __$$ItemEntityImplCopyWithImpl(
      _$ItemEntityImpl _value, $Res Function(_$ItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roomId = null,
    Object? category = null,
    Object? quantity = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isFavorite = null,
    Object? expirationDate = freezed,
  }) {
    return _then(_$ItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ItemEntityImpl implements _ItemEntity {
  const _$ItemEntityImpl(
      {required this.id,
      required this.name,
      required this.roomId,
      required this.category,
      required this.quantity,
      this.description = '',
      required this.createdAt,
      required this.updatedAt,
      this.isFavorite = false,
      this.expirationDate});

  @override
  final String id;
  @override
  final String name;
  @override
  final String roomId;
  @override
  final ItemCategory category;
  @override
  final int quantity;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime? expirationDate;

  @override
  String toString() {
    return 'ItemEntity(id: $id, name: $name, roomId: $roomId, category: $category, quantity: $quantity, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, isFavorite: $isFavorite, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, roomId, category,
      quantity, description, createdAt, updatedAt, isFavorite, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      __$$ItemEntityImplCopyWithImpl<_$ItemEntityImpl>(this, _$identity);
}

abstract class _ItemEntity implements ItemEntity {
  const factory _ItemEntity(
      {required final String id,
      required final String name,
      required final String roomId,
      required final ItemCategory category,
      required final int quantity,
      final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isFavorite,
      final DateTime? expirationDate}) = _$ItemEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get roomId;
  @override
  ItemCategory get category;
  @override
  int get quantity;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isFavorite;
  @override
  DateTime? get expirationDate;
  @override
  @JsonKey(ignore: true)
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
