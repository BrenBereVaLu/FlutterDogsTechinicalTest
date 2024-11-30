import 'dart:io';

import 'package:http/http.dart';

import '../../domain/either/either.dart';

class Http {
  Http({required Client client, required String baseUrl})
      : _client = client,
        _baseUrl = baseUrl;
  final Client _client;
  final String _baseUrl;

  Future<Either<HttpFailure, T>> request<T>(String path,
      {required T Function(String responseBody) onSuccess,
      HttpMethod method = HttpMethod.get}) async {
    try {
      Uri url = Uri.parse('$_baseUrl$path');
      late final Response response;

      switch (method) {
        case HttpMethod.get:
          response = await _client.get(url);
          break;
      }
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(onSuccess(response.body));
      }
      return Either.left(HttpFailure(statusCode: statusCode));
    } catch (e) {
      if (e is SocketException) {
        return Either.left(HttpFailure(
          exception: NetworkException(),
        ));
      }

      return Either.left(HttpFailure(
        exception: e,
      ));
    }
  }
}

class HttpFailure {
  HttpFailure({
    this.statusCode,
    this.exception,
  });

  final int? statusCode;
  final Object? exception;
}

class NetworkException {}

enum HttpMethod { get }
