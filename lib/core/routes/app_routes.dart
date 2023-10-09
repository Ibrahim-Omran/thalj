import 'package:flutter/material.dart';
import 'package:thalj/features/home/presentation/screens/product_info_screen.dart';
import 'package:thalj/features/home/presentation/screens/uploading_supporting_documents_screen.dart';


class Routes {
  static const String intitlRoute = '/';
  static const String productInformationScreen = '/productInformationScreen';
  static const String uploadingSupportingDocumentsScreen = '/uploadingSupportingDocumentsScreen';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const UploadingSupportingDocumentsScreen());
      case Routes.productInformationScreen:
        return MaterialPageRoute(builder: (_) => const ProductInformationScreen());
      case Routes.uploadingSupportingDocumentsScreen:
        return MaterialPageRoute(builder: (_)=>const UploadingSupportingDocumentsScreen());
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
