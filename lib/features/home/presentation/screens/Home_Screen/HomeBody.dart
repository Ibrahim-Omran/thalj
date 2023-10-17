import 'package:flutter/material.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/home/presentation/components/home_screen/today_product.dart';

import '../../components/profileAppBar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const ProfileAppBar(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('assets/images/har.png'),
                    height: 50,
                    width: 35,
                  )),
              const Spacer(),
              Text(
                'منتجات اليوم',
                style: boldStyle().copyWith(
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TodayProducts(
                    onTap: () {
                      navigatePushNamed(
                          context: context,
                          route: Routes.productInformationScreen);
                    },
                    location: 'المنطقة',
                    locationTo: 'المنطقة المرسل اليها',
                    productType: 'نوع المنتج',
                  ),
                  TodayProducts(
                    onTap: () {
                      navigatePushNamed(
                          context: context,
                          route: Routes.productInformationScreen);
                    },
                    location: 'المنطقة',
                    locationTo: 'المنطقة المرسل اليها',
                    productType: 'نوع المنتج',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
