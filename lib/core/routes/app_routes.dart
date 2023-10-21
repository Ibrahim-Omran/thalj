import 'package:flutter/material.dart';
import 'package:thalj/features/auth/presentation/screens/owner_screen.dart';
import 'package:thalj/features/auth/presentation/screens/sign_up.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/Home_Screen.dart';
import 'package:thalj/features/home/presentation/screens/admin_options_screen.dart';
import 'package:thalj/features/home/presentation/screens/driver_doucments.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/offers.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/profile.dart';
import 'package:thalj/features/home/presentation/screens/driver_data_sent_to_owner.dart';

import '../../features/adminHome/presenation/screens/driver_subscription_screen.dart';
import '../../features/adminHome/presenation/screens/user_subscription_screen.dart';
import '../../features/auth/presentation/screens/signin_screen.dart';
import 'package:thalj/features/documents/presentation/screens/documents_screen.dart';
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
  static const String userInvoices = '/userInvoices';
  static const String driverInvoices = '/driverInvoices';
  static const String driverDataSentToOwner = '/driverDataSentToOwner';
  static const String driverOptions = '/driverOptions';
}

Widget appRoutes(String route, dynamic arg) {
  switch (route) {
    case Routes.intitlRoute:
      return const SignInScreen();
    case Routes.signup:
      return const SignUpScreen();
    case Routes.ownerScreen:
      return const OwnerScreen();
    case Routes.homeScreen:
      return const HomeScreen();

    case Routes.uploadingSupportingDocumentsScreen:
      return const UploadingSupportingDocumentsScreen();
    case Routes.documentsCheckScreen:
      return const DocumentsCheckScreen();
    case Routes.offersScreen:
      return const Offers();
    case Routes.profileScreen:
      return const Profile();

    case Routes.driverDoc:
      return const DriverDocuments();
    case Routes.driverDataSentToOwner:
      return const DriverDataSentToOwner();
    case Routes.driverOptions:
      return const AdminOptionsScreen();
    case Routes.userInvoices:
      return const UserSubscriptionScreen();
    case Routes.driverInvoices:
      return const DriverSubscriptionScreen();
    default:
      return const Scaffold(
        body: Center(
          child: Text('Not Found..!'),
        ),
      );
  }
}
