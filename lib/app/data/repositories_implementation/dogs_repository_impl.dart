import '../../domain/either/either.dart';
import '../../domain/failure/http_request/http_request_failure.dart';
import '../../domain/models/dogs/allDogs.dart';
import '../../domain/repositories/dogs_repository.dart';
import '../services/remote/dogs_api.dart';

class DogsRepositoryImpl implements DogsRepository {
  //Inyeccion de dependencias permite que el codigo sea testeable
  DogsRepositoryImpl(this._dogsApi);

  final DogsApi _dogsApi;

  @override
  Future<Either<HttpRequestFailure, List<Alldogs>>> getListAllDogs() {
    return _dogsApi.getListDogs();
  }
}
