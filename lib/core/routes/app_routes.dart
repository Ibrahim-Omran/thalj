import 'package:flutter/material.dart';
import 'package:thalj/features/auth/presentation/screens/owner_screen.dart';
import 'package:thalj/features/auth/presentation/screens/sign_up.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/Home_Screen.dart';
import 'package:thalj/features/home/presentation/screens/driver_doucments.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/offers.dart';
import 'package:thalj/features/home/presentation/screens/product_details.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/profile.dart';
import 'package:thalj/features/home/presentation/screens/driver_data_sent_to_owner.dart';

import '../../features/auth/presentation/screens/signin_screen.dart';
import 'package:thalj/features/documents/presentation/screens/documents_screen.dart';
import 'package:thalj/features/home/presentation/screens/product_info_screen.dart';
import 'package:thalj/features/documents/presentation/screens/uploading_supporting_documents_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String signup = '/signup';
  static const String ownerScreen = '/owner';
  static const String homeScreen = '/home';

  static const String productInformationScreen = '/productInformationScreen';
  static const String uploadingSupportingDocumentsScreen =
      '/uploadingSupportingDocumentsScreen';
  static const String documentsCheckScreen = '/documentsCheckScreen';
  static const String offersScreen = '/offer';
  static const String profileScreen = '/profile';
  static const String productDetails = '/productDetails';
  static const String driverDoc = '/driverDoc';
  static const String driverDataSentToOwner = '/driverDataSentToOwner';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.ownerScreen:
        return MaterialPageRoute(builder: (_) => OwnerScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.productInformationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProductInformationScreen());
      case Routes.uploadingSupportingDocumentsScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadingSupportingDocumentsScreen());
      case Routes.documentsCheckScreen:
        return MaterialPageRoute(builder: (_) => const DocumentsCheckScreen());

      case Routes.offersScreen:
        return MaterialPageRoute(builder: (_) => const Offers());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const Profile());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetails());
      case Routes.driverDoc:
        return MaterialPageRoute(builder: (_) => const DriverDocuments());
      case Routes.driverDataSentToOwner:
        return MaterialPageRoute(builder: (_) => const DriverDataSentToOwner());
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
