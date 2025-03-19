// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoCategory _$TodoCategoryFromJson(Map<String, dynamic> json) {
  return _TodoCategory.fromJson(json);
}

/// @nodoc
mixin _$TodoCategory {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TodoCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoCategoryCopyWith<TodoCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCategoryCopyWith<$Res> {
  factory $TodoCategoryCopyWith(
          TodoCategory value, $Res Function(TodoCategory) then) =
      _$TodoCategoryCopyWithImpl<$Res, TodoCategory>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String icon,
      int? color,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TodoCategoryCopyWithImpl<$Res, $Val extends TodoCategory>
    implements $TodoCategoryCopyWith<$Res> {
  _$TodoCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? icon = null,
    Object? color = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoCategoryImplCopyWith<$Res>
    implements $TodoCategoryCopyWith<$Res> {
  factory _$$TodoCategoryImplCopyWith(
          _$TodoCategoryImpl value, $Res Function(_$TodoCategoryImpl) then) =
      __$$TodoCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String icon,
      int? color,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TodoCategoryImplCopyWithImpl<$Res>
    extends _$TodoCategoryCopyWithImpl<$Res, _$TodoCategoryImpl>
    implements _$$TodoCategoryImplCopyWith<$Res> {
  __$$TodoCategoryImplCopyWithImpl(
      _$TodoCategoryImpl _value, $Res Function(_$TodoCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? icon = null,
    Object? color = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TodoCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoCategoryImpl implements _TodoCategory {
  const _$TodoCategoryImpl(
      {this.id,
      required this.name,
      required this.icon,
      required this.color,
      required this.createdAt,
      required this.updatedAt});

  factory _$TodoCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final int? color;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TodoCategory(id: $id, name: $name, icon: $icon, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, color, createdAt, updatedAt);

  /// Create a copy of TodoCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoCategoryImplCopyWith<_$TodoCategoryImpl> get copyWith =>
      __$$TodoCategoryImplCopyWithImpl<_$TodoCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoCategoryImplToJson(
      this,
    );
  }
}

abstract class _TodoCategory implements TodoCategory {
  const factory _TodoCategory(
      {final int? id,
      required final String name,
      required final String icon,
      required final int? color,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TodoCategoryImpl;

  factory _TodoCategory.fromJson(Map<String, dynamic> json) =
      _$TodoCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  int? get color;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TodoCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoCategoryImplCopyWith<_$TodoCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
