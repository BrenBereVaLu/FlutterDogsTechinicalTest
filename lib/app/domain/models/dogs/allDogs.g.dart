// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allDogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlldogsImpl _$$AlldogsImplFromJson(Map<String, dynamic> json) =>
    _$AlldogsImpl(
      dogName: json['dogName'] as String,
      description: json['description'] as String,
      age: (json['age'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$AlldogsImplToJson(_$AlldogsImpl instance) =>
    <String, dynamic>{
      'dogName': instance.dogName,
      'description': instance.description,
      'age': instance.age,
      'image': instance.image,
    };
