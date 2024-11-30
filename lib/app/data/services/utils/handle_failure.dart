import '../../../domain/either/either.dart';
import '../../../domain/failure/http_request/http_request_failure.dart';
import '../../http/http.dart';

Either<HttpRequestFailure, R> handleHttpFailure<R>(HttpFailure httpFailure) {
  final failure = () {
    final statusCode = httpFailure.statusCode;
    switch (statusCode) {
      case 404:
        return HttpRequestFailure.notFound();
      case 401:
        return HttpRequestFailure.unAuthorized();
    }

    if (httpFailure.exception is NetworkException) {
      return HttpRequestFailure.network();
    }

    return HttpRequestFailure.unknown();
  }();

  return Either.left(failure);
}
