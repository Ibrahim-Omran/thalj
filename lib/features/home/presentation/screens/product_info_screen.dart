import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';
import '../components/product_info/custom_sender_and_recipient_info.dart';
import '../components/product_info/custom_shipping_info.dart';

class ProductInformationScreen extends StatelessWidget {
  const ProductInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
            const CustomSenderAndRecipientInfo(
              senderOrRecipientInfo: AppStrings.senderInfo,
              region: 'القاهرة',
              addressDetails: 'مصر الجديدة',
              buildingNumber: '04',
              floorNumber: '02',
              apartmentNumber: '06',
              specialMarque: 'بجوار ماك',
              phoneNumberInfo: '00201016455643',
            ),
            SizedBox(
              height: 24.h,
            ),
            const CustomSenderAndRecipientInfo(
              senderOrRecipientInfo: AppStrings.recipientInfo,
              region: 'القاهرة',
              addressDetails: 'مصر الجديدة',
              buildingNumber: '04',
              floorNumber: '02',
              apartmentNumber: '06',
              specialMarque: 'بجوار ماك',
              phoneNumberInfo: '00201016455643',
            ),
            SizedBox(
              height: 24.h,
            ),
            const CustomShippingInfo(
              shippingDescription: 'shippingDescription',
              shippingType: 'shippingType',
              weight: '80',
              temp: '27',
              humidity: '0.5',
              specialMarque: 's',
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(
              onPressed: () {
                navigatePushNamed(context: context, route: Routes.productDetails);
              },
              text: AppStrings.sendOffer,
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    ));
  }
}
