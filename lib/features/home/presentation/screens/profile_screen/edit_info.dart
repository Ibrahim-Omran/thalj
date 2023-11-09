import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/widgets/back_arrow.dart';
import 'package:thalj/core/widgets/logo.dart';
import 'package:thalj/features/home/presentation/bloc/editInfo/editInfo_state.dart';
import 'package:thalj/features/home/presentation/components/editScreens/editEmail.dart';

import '../../../../../core/local/cash_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/repository.dart';
import '../../bloc/editInfo/editInfo_bloc.dart';
import '../../components/editScreens/EditPassword.dart';
import '../../components/editScreens/editPhone.dart';
import '../../components/editScreens/edit_name.dart';

class EditInfo extends StatelessWidget {
   EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
              create: (context) =>
                  EditInfoBloc(homeRepository: context.read<HomeRepository>()),
              child: _body(context))),
    );
  }

  String name = CacheHelper.getData(key: 'fullname');
  String token = CacheHelper.getData(key: 'loginToken');

  String email = CacheHelper.getData(key: 'email');

  var phone = CacheHelper.getData(key: 'phone');

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackArrow(),
              ],
            ),
          ),
          const Center(child: LogoWidget()),
          SizedBox(
            height: 40.h,
          ),
          BlocBuilder<EditInfoBloc, EditInfoState>(builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (context) => EditInfoBloc(
                                      homeRepository:
                                          context.read<HomeRepository>()),
                                  child: const EditNamePro())));
                    },
                    icon: const Icon(Icons.edit)),
                Column(
                  children: [
                    Text(
                      AppStrings.userName,
                      style: boldStyle(color: AppColors.primary),
                    ),
                    Text(
                      name,
                      style: regularStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ],
            );
          }),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<EditInfoBloc, EditInfoState>(
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (context) => EditInfoBloc(
                                        homeRepository:
                                            context.read<HomeRepository>()),
                                    child: const EditEmailPro())));
                      },
                      icon: const Icon(Icons.edit)),
                  Column(
                    children: [
                      Text(
                        AppStrings.editEmail,
                        style: boldStyle(color: AppColors.primary),
                      ),
                      Text(
                        email,
                        style: regularStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<EditInfoBloc, EditInfoState>(
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (context) => EditInfoBloc(
                                        homeRepository:
                                            context.read<HomeRepository>()),
                                    child: const EditPhonePro())));
                      },
                      icon: const Icon(Icons.edit)),
                  Column(
                    children: [
                      Text(AppStrings.phone,
                          style: boldStyle(color: AppColors.primary)),
                      Text(
                        phone.toString(),
                        style: regularStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<EditInfoBloc, EditInfoState>(builder: (context, state) {
            return TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                              create: (context) => EditInfoBloc(
                                  homeRepository:
                                      context.read<HomeRepository>()),
                              child: const EditPasswordPro())));
                },
                child: Text(
                  AppStrings.editPassword,
                  style: boldStyle(color: AppColors.primary),
                ));
          }),
          SizedBox(
            height: 15.h,
          ),
          TextButton(
              onPressed: () async {

               await CacheHelper.clearAll().then((value) {
                  value = true;
                  if (value) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.signIN,
                      (route) => false,
                    );
                  }
                });

              },
              child: Text(
                "تسجيل الخروج",
                style: boldStyle(color: AppColors.primary),
              )),
        ],
      ),
    );
  }
}
