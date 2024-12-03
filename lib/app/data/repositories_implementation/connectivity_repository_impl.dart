import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../services/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  ConnectivityRepositoryImpl(this._connectivity, this._internetChecker);
  //Inyeccion de dependencias permite que el codigo sea testeable
  //No tiene interacción directa con la UI ni maneja eventos; simplemente verifica la conectividad.
  //Implementación del patrón de repositorio
  //Define la abstracción para verificar si hay conexión a Internet disponible.
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;
  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return _internetChecker.hasInternet();
  }
}
