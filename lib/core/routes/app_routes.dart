import 'package:flutter/material.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/Home_Screen.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';
import 'package:thalj/features/documents/presentation/screens/documents_screen.dart';
import 'package:thalj/features/home/presentation/screens/product_info_screen.dart';
import 'package:thalj/features/home/presentation/screens/uploading_supporting_documents_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String productInformationScreen = '/productInformationScreen';
  static const String uploadingSupportingDocumentsScreen =
      '/uploadingSupportingDocumentsScreen';
  static const String documentsCheckScreen = '/documentsCheckScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

        return MaterialPageRoute(
            builder: (_) => const UploadingSupportingDocumentsScreen());
      case Routes.productInformationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProductInformationScreen());
      case Routes.uploadingSupportingDocumentsScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadingSupportingDocumentsScreen());
      case Routes.documentsCheckScreen:
        return MaterialPageRoute(builder: (_) => const DocumentsCheckScreen());
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
