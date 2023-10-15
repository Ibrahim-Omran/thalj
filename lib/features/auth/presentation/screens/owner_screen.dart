import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:thalj/core/widgets/custom_button.dart';
import 'package:thalj/features/auth/presentation/components/owner_login_bloc/bloc_owner_login.dart';
import 'package:thalj/features/auth/presentation/components/owner_login_bloc/bloc__owner_login_events.dart';
import 'package:thalj/features/auth/presentation/components/owner_login_bloc/bloc__owner_login_states.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../../domain/repository.dart';
import '../components/text_filed.dart';

class OwnerScreen extends StatelessWidget {
   OwnerScreen({super.key});

  late bool _isPassword = true;
   final _formKey = GlobalKey<FormState>();

   final TextEditingController _userNameController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocProvider(create:(context) =>
            OwnerLoginBloc(authRepository: context.read<AuthRepository>())
          ,child: _ownerScreenView(),)
    );
  }

  Widget _ownerScreenView ()
  {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackArrow(),
                const Center(child: LogoWidget()),
                BlocBuilder<OwnerLoginBloc,OwnerLoginState>(builder: (context,state){
                  return MyFormField(
                    controller:_userNameController ,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.ownerEmail,
                    hint: 'example@mail.com',
                    onSubmit: (value) => BlocProvider.of<OwnerLoginBloc>(context)
                        .add(OwnerLoginUserName(userName: value)),

                  );
                }),
               BlocBuilder<OwnerLoginBloc,OwnerLoginState>(builder: (context, state){
                 return  MyFormField(
                   controller: _passwordController,
                   prefixIcon: _isPassword
                       ? Icons.visibility_outlined
                       : Icons.visibility_off_outlined,
                   prefixIconPressed: () {
                     _isPassword = !_isPassword;
                     BlocProvider.of<OwnerLoginBloc>(context).add(OwnerLoginToggleObscureText(isPassword: _isPassword));
                   },
                   isPassword: _isPassword,
                   type: TextInputType.text,
                   maxLines: 1,
                   readonly: false,
                   title: AppStrings.passOwner,
                   hint: 'كلمه المرور',
                 );
               }),
                SizedBox(
                  height: 40.h,
                ),
                BlocBuilder<OwnerLoginBloc,OwnerLoginState>(builder: (context,state){
                  return CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        BlocProvider.of<OwnerLoginBloc>(context).add(OwnerLoginSubmitted());

                      }
                    },
                    text: AppStrings.signIn,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

