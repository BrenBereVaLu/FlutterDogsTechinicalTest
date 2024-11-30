import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'app/data/http/http.dart';
import 'app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'app/data/repositories_implementation/dogs_repository_impl.dart';
import 'app/data/services/remote/dogs_api.dart';
import 'app/data/services/remote/internet_checker.dart';
import 'app/domain/repositories/connectivity_repository.dart';
import 'app/domain/repositories/dogs_repository.dart';
import 'app/my_app.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Esto asegura la inicialización correcta
  runApp(MultiProvider(
    providers: [
      Provider<DogsRepository>(
          create: (_) => DogsRepositoryImpl(DogsApi(Http(
              client: http.Client(), baseUrl: 'https://jsonblob.com/api/')))),
      Provider<ConnectivityRepository>(
          create: (_) =>
              ConnectivityRepositoryImpl(Connectivity(), InternetChecker())),
    ],
    child: const MyApp(),
  ));
}
