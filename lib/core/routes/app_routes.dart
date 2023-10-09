import 'package:flutter/material.dart';
import 'package:thalj/features/home/presentation/screens/product_info_screen.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String productInformationScreen = '/productInformationScreen';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.productInformationScreen:
        return MaterialPageRoute(builder: (_) => const ProductInformationScreen());

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
