import 'package:flutter/material.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/home/presentation/components/home_screen/today_product.dart';

import '../../../../../core/widgets/back_arrow.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.19,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff1F6EC3),
                Color(0xff155293),
                Color(0xff155293),
              ])),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const BackArrow(),
                    const Spacer(),
                    Column(children: [
                      Text('مرحبا بك',
                          style: boldStyle(color: Colors.white, fontSize: 20)),
                      Text(
                        'احمد',
                        style: boldStyle(color: Colors.white, fontSize: 20),
                        overflow: TextOverflow.clip,
                      ),
                    ]),
                    const SizedBox(
                      width: 5,
                    ),
                    const Image(
                      image: AssetImage('assets/images/human.png'),
                      height: 60,
                      width: 70,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
                      navigate(
                          context: context,
                          route: Routes.productInformationScreen);
                    },
                    location: 'المنطقة',
                    locationTo: 'المنطقة المرسل اليها',
                    productType: 'نوع المنتج',
                  ),
                  TodayProducts(
                    onTap: () {
                      navigate(
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
