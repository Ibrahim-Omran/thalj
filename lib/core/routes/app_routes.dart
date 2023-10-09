import 'package:flutter/material.dart';
import 'package:thalj/features/auth/presentation/screens/owner_screen.dart';
import 'package:thalj/features/auth/presentation/screens/sign_up.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String signup = '/signup';
  static const String ownerScreen = '/owner';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.ownerScreen:
        return MaterialPageRoute(builder: (_) => const OwnerScreen());

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
