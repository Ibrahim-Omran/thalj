import 'package:flutter/material.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/Home_Screen.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String signup = '/signup';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
