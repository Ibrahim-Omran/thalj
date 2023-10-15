import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/features/auth/domain/repository.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, });


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => DocumentCheckingBloc()),
            RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepository(),


            )

          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: getAppTheme(),
            initialRoute: Routes.intitlRoute,
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
