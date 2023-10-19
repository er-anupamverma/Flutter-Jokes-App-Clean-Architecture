import 'package:flutter/material.dart';
import '../../features/jokes/presentation/pages/home/jokes.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Jokes());
      default:
        return _materialRoute(const Jokes());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
