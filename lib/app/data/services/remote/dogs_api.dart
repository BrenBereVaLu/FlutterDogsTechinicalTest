import 'dart:convert';

import '../../../domain/either/either.dart';
import '../../../domain/failure/http_request/http_request_failure.dart';
import '../../../domain/models/dogs/allDogs.dart';
import '../../http/http.dart';
import '../local/database/dogs_database.dart';
import '../utils/handle_failure.dart';

class DogsApi {
  DogsApi(this._http);

  final Http _http;

  Future<Either<HttpRequestFailure, List<Alldogs>>> getListDogs() async {
    final result =
        await _http.request('1151549092634943488', onSuccess: (json) {
      // Si json es un String, parsearlo a List<Map<String, dynamic>>
      final list = List<Map<String, dynamic>>.from(jsonDecode(json));
      final dogs = list.map((e) => Alldogs.fromJson(e)).toList();

      // Guardar en SQLite
      final db = DogsDatabase.instance;
      db.deleteAllDogs(); // Limpiar datos anteriores
      for (var dog in dogs) {
        db.insertDog(dog);
      }
      return dogs;
    });

    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
