import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/errors/internetCheck.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/data/remote_data_source.dart';
import 'features/auth/domain/repository.dart';
import 'features/documents/data/remote_data.dart';
import 'features/documents/domain/repository.dart';
import 'features/home/data/remote_data_source.dart';
import 'features/home/domain/repository.dart';

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
            RepositoryProvider<DriverRepository>(
              create: (context) => DriverRepository(DriverRemoteDataSource()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: getAppTheme(),
            initialRoute: Routes.intitlRoute,
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
