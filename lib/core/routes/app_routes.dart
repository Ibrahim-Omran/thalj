import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String signup = '/signup';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

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
