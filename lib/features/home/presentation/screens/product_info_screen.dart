import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/widgets/custom_button.dart';

import 'package:thalj/features/home/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:thalj/features/home/presentation/screens/product_details.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';

import '../bloc/orders_bloc/orders_event.dart';
import '../bloc/orders_bloc/orders_state.dart';
import '../components/product_info/custom_sender_and_recipient_info.dart';
import '../components/product_info/custom_shipping_info.dart';

class ProductInformationScreen extends StatelessWidget {
  const ProductInformationScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetOrdersDataBloc>(context).add(GetOneOrdersData(id));

    return Scaffold(
        body: BlocBuilder<GetOrdersDataBloc, GetOrdersDataState>(
        builder: (BuildContext context, state) {
          if (state is GetOneOrdersDataSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
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
                      region:state.ordersOneData.senderInfo.region ,
                      addressDetails: state.ordersOneData.senderInfo.location,
                      buildingNumber: state.ordersOneData.senderInfo.buildingNumber.toString(),
                      floorNumber: state.ordersOneData.senderInfo.floorNumber,
                      apartmentNumber: state.ordersOneData.senderInfo.apartmentNumber.toString(),
                      specialMarque: state.ordersOneData.senderInfo.specialSign,
                      phoneNumberInfo: state.ordersOneData.senderInfo.phoneNumber.toString(),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                     CustomSenderAndRecipientInfo(
                      senderOrRecipientInfo: AppStrings.recipientInfo,
                      region: state.ordersOneData.recipientInfo.region,
                      addressDetails: state.ordersOneData.recipientInfo.location,
                      buildingNumber: state.ordersOneData.recipientInfo.buildingNumber.toString(),
                      floorNumber: state.ordersOneData.recipientInfo.floorNumber.toString(),
                      apartmentNumber: state.ordersOneData.recipientInfo.apartmentNumber.toString(),
                      specialMarque: state.ordersOneData.recipientInfo.specialSign,
                      phoneNumberInfo: state.ordersOneData.recipientInfo.phoneNumber.toString(),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                     CustomShippingInfo(
                      shippingDescription: state.ordersOneData.freightInfo.description,
                      shippingType: state.ordersOneData.freightInfo.name,
                      weight: state.ordersOneData.freightInfo.weight.toString(),
                      temp: state.ordersOneData.freightInfo.temperature.toString(),
                      humidity: state.ordersOneData.freightInfo.temperature.toString(),
                      specialMarque: 's',
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Builder(
                                  builder: (BuildContext context) {
                                    return ProductDetails(
                                      id: id,
                                    );
                                  },
                                ))
                        );

                      },
                      text: AppStrings.sendOffer,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is GetOneOrdersDataFailure) {
            return const Center(child: Text("Server Error"));
          }
          if (state is GetOneOrdersDataLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          else {
            return const Text("");
          }
        }

        ),

    );


  }
        }
