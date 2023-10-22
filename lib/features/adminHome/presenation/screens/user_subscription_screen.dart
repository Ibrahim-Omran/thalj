import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/utils/app_text_style.dart';

import '../../../../core/widgets/custom_app_bar_product_info.dart';
import '../bloc/user_invoice_bloc/user_invoice_bloc.dart';
import '../bloc/user_invoice_bloc/user_invoice_event.dart';
import '../bloc/user_invoice_bloc/user_invoice_state.dart';
import '../components/custom_user_invoice.dart';

class UserSubscriptionScreen extends StatelessWidget {
  const UserSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _body(context),
    ));
  }

  Widget _body(BuildContext context) {
    BlocProvider.of<UserInvoiceBloc>(context).add(FetchUserInvoices());

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const CustomAppBar(title: ":وصولات دفع العملاء"),
          BlocBuilder<UserInvoiceBloc, UserInvoiceState>(
            builder: (context, state) {
              if (state is UserInvoiceLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.userInvoices.length,
                    itemBuilder: (context, index) {
                      return CustomUserInvoice(
                        userInvoiceModel: state.userInvoices[index],
                      );
                    },
                  ),
                );
              }else if (state is UserInvoiceError) {
               return Center(child: Text(
                  "لا توجد فواتير",
                  style: boldStyle(),
                ));
              }

              else if (state is UserInvoiceLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
