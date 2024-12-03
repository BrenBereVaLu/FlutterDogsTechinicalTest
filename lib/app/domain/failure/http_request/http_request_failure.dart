import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

//Genera codigo relacionado con clase inmutables es decir no pueden ser cambiados despues de ser inicializados
//Maneja diferentes estados para manejar estados de UI
//Crea codigo por medio del build_runner que genera automaticamente metodos como copyWith, serialización/deserialización
//constructores personalizados
@freezed
class HttpRequestFailure with _$HttpRequestFailure {

  factory HttpRequestFailure.notFound() = _HttpRequestFailureNotFound;
  factory HttpRequestFailure.network() = _HttpRequestFailureNetwork;
  factory HttpRequestFailure.unAuthorized() = _HttpRequestFailureUnauthorized;
  factory HttpRequestFailure.unknown() = _HttpRequestFailureNotFoundUnknown;


}