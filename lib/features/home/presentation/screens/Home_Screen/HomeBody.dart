import 'package:flutter/material.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';

import '../../../../auth/presentation/components/back_arrow.dart';

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
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigate(context: context, route: Routes.productInformationScreen);
                  },
                  child: SizedBox(
                    width: 200,
                    child: Card(
                      color: const Color(0xffF0F3FD),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'المنطقة',
                                  style: boldStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primary,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 20),
                                    child: Text(
                                      'المنطقة المرسل اليها',
                                      style: boldStyle(fontSize: 15),
                                    ),
                                  ),
                                ),

                                const Image(
                                  image: AssetImage('assets/images/loc.png'),
                                  height: 20,
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'نوع المنتج',
                                  style: boldStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Image(
                                  image: AssetImage('assets/images/moka.png'),
                                  height: 20,
                                  width: 30,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 200,
                  child: Card(
                    color: const Color(0xffF0F3FD),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'المنطقة',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: Text(
                                    'المنطقة المرسل اليها',
                                    style: boldStyle(fontSize: 15),
                                  ),
                                ),
                              ),

                              const Image(
                                image: AssetImage('assets/images/loc.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'نوع المنتج',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Image(
                                image: AssetImage('assets/images/moka.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 200,
                  child: Card(
                    color:const Color(0xffF0F3FD),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'المنطقة',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: Text(
                                    'المنطقة المرسل اليها',
                                    style: boldStyle(fontSize: 15),
                                  ),
                                ),
                              ),

                              const Image(
                                image: AssetImage('assets/images/loc.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'نوع المنتج',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Image(
                                image: AssetImage('assets/images/moka.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 200,
                  child: Card(
                    color: const Color(0xffF0F3FD),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'المنطقة',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: Text(
                                    'المنطقة المرسل اليها',
                                    style: boldStyle(fontSize: 15),
                                  ),
                                ),
                              ),

                              const Image(
                                image: AssetImage('assets/images/loc.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'نوع المنتج',
                                style: boldStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Image(
                                image: AssetImage('assets/images/moka.png'),
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    )
      ],
    );
  }
}
