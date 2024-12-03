import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'allDogs.freezed.dart';
part 'allDogs.g.dart';
// freezed +  json_serializable =, 
//modelos que se serialicen y deserialicen de JSON automáticamente
@freezed
class Alldogs with _$Alldogs {
  factory Alldogs({
    required String dogName,
    required String description,
    required int age,
    required String image,
  }) = _Alldogs;

  // Asegúrate de que esta función esté configurada correctamente
  factory Alldogs.fromJson(Json json) => _$AlldogsFromJson(json);
}
