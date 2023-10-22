import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/commons.dart';
import '../../domain/models/user_invoice_model.dart';
import '../bloc/user_invoice_bloc/user_invoice_bloc.dart';
import '../bloc/user_invoice_bloc/user_invoice_event.dart';
import '../bloc/user_invoice_bloc/user_invoice_state.dart';

class CustomUserInvoice extends StatelessWidget {
  const CustomUserInvoice({super.key, required this.userInvoiceModel});
  final UserInvoiceModel userInvoiceModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      height: 273,
      color: const Color.fromRGBO(224, 232, 255, 0.63),
      child: CachedNetworkImage(
        imageUrl: userInvoiceModel.image,
        placeholder: (context, url) {
          return Shimmer.fromColors(
              baseColor: AppColors.primary,
              highlightColor: AppColors.lightBlue,
              child: const SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
              ));
        },
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),

        ),
        const SizedBox(
          height: 5,
        ),
       BlocBuilder<UserInvoiceBloc,UserInvoiceState>(builder: (context,state){
         return  state is AccUserInvoiceLoading
             ? const Center(child: CircularProgressIndicator.adaptive())
             : SizedBox(
           width: double.infinity,
           child: ElevatedButton(
               style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(
                       const Color(0xFF3CC26F))),
               onPressed: () {
                 BlocProvider.of<UserInvoiceBloc>(context).add(
                     AccUserInvoice(invoiceID: userInvoiceModel.id, orderID: userInvoiceModel.orderId ,
                        ));
                 navigatePushReplacement(
                     context: context, route: Routes.userInvoices);

               },
               child: const Text(
                 'موافقة',
                 style: TextStyle(fontSize: 20, color: Colors.black),
               )),
         );
       })
      ],
    );
  }
}
