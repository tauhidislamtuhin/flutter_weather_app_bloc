import 'package:flutter/material.dart';
import 'package:flutter_weather_app_bloc/view/screens/home_screen.dart';
import 'package:flutter_weather_app_bloc/view/screens/welcome_screeen.dart';
import 'package:go_router/go_router.dart';

import '../view/seceond_ui/screen/home_page.dart';

part 'routes.dart';

class RoutePages {
  static final ROUTER = GoRouter(routes: [
    GoRoute(
        path: Routes.HOME,
        name: Routes.HOME,
        pageBuilder: (context, state) =>
        const MaterialPage(child: HomeScreen())),
    GoRoute(
        path: Routes.WELCOME_ROUTE,
        name: Routes.WELCOME_ROUTE,
        pageBuilder: (context, state) =>
        const MaterialPage(child: WelcomeScreeen())),
  ]);
}
