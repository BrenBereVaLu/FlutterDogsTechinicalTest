//Declarar getter o funciones que no tienen cuerpo
//van hacer implementados en la capa de data
import '../either/either.dart';
import '../failure/http_request/http_request_failure.dart';
import '../models/dogs/allDogs.dart';

abstract class DogsRepository {
  Future<Either<HttpRequestFailure, List<Alldogs>>> getListAllDogs();
}
