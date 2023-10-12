import 'package:flutter/material.dart';
import 'package:thalj/features/auth/presentation/components/text_filed.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar_product_info.dart';
import '../../../../../core/widgets/custom_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              children: [
                CustomAppBar(
                    img: AppAssets.moka,
                    title: AppStrings.productDetails,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.productName),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.price),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MyFormField(
                      type: TextInputType.text,
                      hint: "",
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.number),
                ),


                Spacer(),
                CustomButton(onPressed: () {  }, text: AppStrings.send,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
