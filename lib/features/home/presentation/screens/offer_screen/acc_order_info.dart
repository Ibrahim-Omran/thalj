import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/features/home/presentation/bloc/delevired_bloc/delivered_bloc.dart';
import 'package:thalj/features/home/presentation/bloc/delevired_bloc/delivered_bloc_state.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar_product_info.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/models/accepted_OrderModel.dart';
import '../../bloc/delevired_bloc/delivered_bloc_event.dart';
import '../../components/product_info/custom_sender_and_recipient_info.dart';
import '../../components/product_info/custom_shipping_info.dart';

class AccOrderInfo extends StatelessWidget {
  final List<AcceptedOrdersModel> data;
  const AccOrderInfo({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                height: 62.h,
              ),
              const CustomAppBar(
                img: AppAssets.infoProductIcon,
                title: AppStrings.productInfo,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomSenderAndRecipientInfo(
                senderOrRecipientInfo: AppStrings.senderInfo,
                region:data[0].region! ,
                addressDetails: data[0].location!,
                buildingNumber: data[0].buildingNumber!.toString(),
                floorNumber: data[0].floor!,
                apartmentNumber:data[0].apartmentNumber!.toString(),
                specialMarque: data[0].specialSign!,
                phoneNumberInfo: data[0].phoneNumber!.toString(),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomSenderAndRecipientInfo(
                senderOrRecipientInfo: AppStrings.recipientInfo,
                region:data[0].regionRecipient!,
                addressDetails: data[0].locationRecipient!,
                buildingNumber: data[0].buildingNumberRecipient!.toString(),
                floorNumber: data[0].floorRecipient.toString(),
                apartmentNumber: data[0].apartmentNumberRecipient!.toString(),
                specialMarque: data[0].specialSignRecipient!.toString(),
                phoneNumberInfo:data[0].phoneNumberRecipient!.toString(),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomShippingInfo(
                shippingDescription: data[0].description!,
                shippingType: data[0].name!,
                weight: data[0].weight!.toString(),
                temp: data[0].temperature!.toString(),
                humidity: data[0].humidity!.toString(),
              ),
              SizedBox(
                height: 32.h,
              ),
             BlocConsumer<DeliveredBloc,DeliveredOfferState>(builder: (context,state){
               return state.isSubmitting
                   ? const CircularProgressIndicator.adaptive()
                   :  CustomButton(
                 background: Colors.green,

                 onPressed: () {
                   BlocProvider.of<DeliveredBloc>(context).add(
                       DeliveredOfferSubmitted(

                         id:data[0].id!
                       ));



                 },
                 text:AppStrings.deliverdDone,
               );
             }, listener: (BuildContext context, DeliveredOfferState state) {
               if(state.isSuccess)
                 {
                   navigateAndKill(context: context, route: Routes.homeScreen);
                   showToast(text: "تم التوصيل بنجاح", state: ToastStates.success);
                 }
             },
             ),
              SizedBox(
                height: 24.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
