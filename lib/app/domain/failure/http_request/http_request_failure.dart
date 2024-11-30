import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

@freezed
class HttpRequestFailure with _$HttpRequestFailure {

  factory HttpRequestFailure.notFound() = _HttpRequestFailureNotFound;
  factory HttpRequestFailure.network() = _HttpRequestFailureNetwork;
  factory HttpRequestFailure.unAuthorized() = _HttpRequestFailureUnauthorized;
  factory HttpRequestFailure.unknown() = _HttpRequestFailureNotFoundUnknown;


}