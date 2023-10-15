import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/features/auth/presentation/components/text_filed.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';
import '../../../../core/widgets/custom_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 860.h,
              child: Column(
                children: [
                  const CustomAppBar(
                      img: AppAssets.moka,
                      title: AppStrings.productDetails,

                      ),
                  SizedBox(height: 15.h,),
                  MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.productName),
                  SizedBox(height: 80.h,),


                  MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.price),
                  SizedBox(height: 80.h,),

                  MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.number),
                  SizedBox(height: 200.h,),




                  CustomButton(onPressed: () {  }, text: AppStrings.send,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
