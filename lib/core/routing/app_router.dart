import 'package:flutter/material.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/home/ui/home_screen.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MyRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}
