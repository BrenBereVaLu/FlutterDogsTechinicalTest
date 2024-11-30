import 'package:flutter/material.dart';

import '../modules/home/views/home_view.dart';
import '../modules/offline/views/offline_view.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

//Map que retorna las rutas utilizando un Getter
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.home: (context) => const HomeView(),
    Routes.offline: (context) => const OfflineView(),
  };
}
