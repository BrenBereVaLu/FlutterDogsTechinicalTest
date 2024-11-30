// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allDogs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Alldogs _$AlldogsFromJson(Map<String, dynamic> json) {
  return _Alldogs.fromJson(json);
}

/// @nodoc
mixin _$Alldogs {
  String get dogName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this Alldogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Alldogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlldogsCopyWith<Alldogs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlldogsCopyWith<$Res> {
  factory $AlldogsCopyWith(Alldogs value, $Res Function(Alldogs) then) =
      _$AlldogsCopyWithImpl<$Res, Alldogs>;
  @useResult
  $Res call({String dogName, String description, int age, String image});
}

/// @nodoc
class _$AlldogsCopyWithImpl<$Res, $Val extends Alldogs>
    implements $AlldogsCopyWith<$Res> {
  _$AlldogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Alldogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogName = null,
    Object? description = null,
    Object? age = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      dogName: null == dogName
          ? _value.dogName
          : dogName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlldogsImplCopyWith<$Res> implements $AlldogsCopyWith<$Res> {
  factory _$$AlldogsImplCopyWith(
          _$AlldogsImpl value, $Res Function(_$AlldogsImpl) then) =
      __$$AlldogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dogName, String description, int age, String image});
}

/// @nodoc
class __$$AlldogsImplCopyWithImpl<$Res>
    extends _$AlldogsCopyWithImpl<$Res, _$AlldogsImpl>
    implements _$$AlldogsImplCopyWith<$Res> {
  __$$AlldogsImplCopyWithImpl(
      _$AlldogsImpl _value, $Res Function(_$AlldogsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Alldogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogName = null,
    Object? description = null,
    Object? age = null,
    Object? image = null,
  }) {
    return _then(_$AlldogsImpl(
      dogName: null == dogName
          ? _value.dogName
          : dogName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlldogsImpl implements _Alldogs {
  _$AlldogsImpl(
      {required this.dogName,
      required this.description,
      required this.age,
      required this.image});

  factory _$AlldogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlldogsImplFromJson(json);

  @override
  final String dogName;
  @override
  final String description;
  @override
  final int age;
  @override
  final String image;

  @override
  String toString() {
    return 'Alldogs(dogName: $dogName, description: $description, age: $age, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlldogsImpl &&
            (identical(other.dogName, dogName) || other.dogName == dogName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dogName, description, age, image);

  /// Create a copy of Alldogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlldogsImplCopyWith<_$AlldogsImpl> get copyWith =>
      __$$AlldogsImplCopyWithImpl<_$AlldogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlldogsImplToJson(
      this,
    );
  }
}

abstract class _Alldogs implements Alldogs {
  factory _Alldogs(
      {required final String dogName,
      required final String description,
      required final int age,
      required final String image}) = _$AlldogsImpl;

  factory _Alldogs.fromJson(Map<String, dynamic> json) = _$AlldogsImpl.fromJson;

  @override
  String get dogName;
  @override
  String get description;
  @override
  int get age;
  @override
  String get image;

  /// Create a copy of Alldogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlldogsImplCopyWith<_$AlldogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
