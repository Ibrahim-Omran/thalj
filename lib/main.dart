import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/errors/internetCheck.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/adminHome/data/remote_data/remote_data_source.dart';
import 'features/adminHome/domain/repository.dart';
import 'features/adminHome/presenation/bloc/driver_subscription_bloc/driver_subscription_bloc.dart';
import 'features/adminHome/presenation/bloc/user_invoice_bloc/user_invoice_bloc.dart';
import 'features/auth/data/remote_data_source.dart';
import 'features/auth/domain/repository.dart';
import 'features/documents/data/remote_data.dart';
import 'features/documents/domain/repository.dart';
import 'features/home/data/remote_data_source.dart';
import 'features/home/domain/repository.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkInfoImpl().checkInternet();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepository(AuthRemoteDataSource()),
            ),
            RepositoryProvider<DocumentRepository>(
              create: (context) =>
                  DocumentRepository(DocumentsRemoteDataSource()),
            ),
            RepositoryProvider<HomeRepository>(
              create: (context) => HomeRepository(HomeRemoteDataSource(),),
            ),
            RepositoryProvider<AdminRepository>(
              create: (context) => AdminRepository(AdminRemoteDataSource()),
            ),

        BlocProvider(
        create: (context) => DriverSubscriptionBloc(adminRepository: context.read<AdminRepository>())),

            BlocProvider(
                create: (context) => UserInvoiceBloc(adminRepository: context.read<AdminRepository>())),





          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: getAppTheme(),
            initialRoute: Routes.initialRoute,
            home: const SplashScreen(animateBottom: true),

            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) =>
                    appRoutes(settings.name!, settings.arguments),
              );
            },
          ),
        );
      },
    );
  }
}
