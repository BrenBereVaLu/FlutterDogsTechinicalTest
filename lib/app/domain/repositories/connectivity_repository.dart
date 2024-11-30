//Declarar getter o funciones que no tienen cuerpo
//van hacer implementados en la capa de data
abstract class ConnectivityRepository {
  Future<bool> get hasInternet;

}
