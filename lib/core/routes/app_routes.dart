import 'package:flutter/material.dart';
import 'package:thalj/features/auth/presentation/screens/owner_screen.dart';
import 'package:thalj/features/auth/presentation/screens/sign_up.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen.dart';
import 'package:thalj/features/adminHome/presenation/screens/admin_options_screen.dart';
import 'package:thalj/features/adminHome/presenation/screens/driver_doucments.dart';
import 'package:thalj/features/home/presentation/screens/offer_screen/offers.dart';
import 'package:thalj/features/home/presentation/screens/profile_screen/profile.dart';
import 'package:thalj/features/adminHome/presenation/screens/driver_data_sent_to_owner.dart';
import 'package:thalj/features/home/presentation/screens/profile_screen/subscription.dart';
import 'package:thalj/features/splash/presentation/views/splash_screen.dart';

import '../../features/adminHome/presenation/screens/driver_subscription_screen.dart';
import '../../features/adminHome/presenation/screens/user_subscription_screen.dart';
import '../../features/auth/presentation/screens/signin_screen.dart';
import 'package:thalj/features/documents/presentation/screens/documents_screen.dart';
import 'package:thalj/features/documents/presentation/screens/uploading_supporting_documents_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signIN = 'signIn';
  static const String signUp = '/signUp';
  static const String ownerScreen = '/owner';
  static const String homeScreen = '/home';

  static const String productInformationScreen = '/productInformationScreen';
  static const String uploadingSupportingDocumentsScreen =
      '/uploadingSupportingDocumentsScreen';
  static const String documentsCheckScreen = '/documentsCheckScreen';
  static const String offersScreen = '/offer';
  static const String profileScreen = '/profile';
  static const String subscription = '/Subscription';
  static const String productDetails = '/productDetails';
  static const String driverDoc = '/driverDoc';
  static const String userInvoices = '/userInvoices';
  static const String driverInvoices = '/driverInvoices';
  static const String driverDataSentToOwner = '/driverDataSentToOwner';
  static const String driverOptions = '/driverOptions';
}

Widget appRoutes(String route, dynamic arg) {
  switch (route) {
    case Routes.initialRoute:
      return const SplashScreen(animateBottom: true);
    case Routes.signIN:
      return const SignInScreen();
    case Routes.signUp:
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
    case Routes.subscription:
      return const Subscription();

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
