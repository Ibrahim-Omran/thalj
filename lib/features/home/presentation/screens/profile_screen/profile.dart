
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-bloc.dart';
import 'package:thalj/features/home/presentation/screens/profile_screen/subscription.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/repository.dart';
import 'edit_info.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditInfo()));
          }, child: Text("تعديل الحساب الشخصي",style: boldStyle(color: AppColors.primary),)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider<PaySubScriptionBloc>(
                create: (context) =>
                    PaySubScriptionBloc(homeRepository: context.read<HomeRepository>() ),
                child: const Subscription())));
          }, child: Text("دفع الاشتراكات",style: boldStyle(color: AppColors.primary),)),


        ],
      ),
    );
  }
}
