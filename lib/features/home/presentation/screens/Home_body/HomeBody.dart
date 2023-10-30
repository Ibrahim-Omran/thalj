
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_text_style.dart';

import 'package:thalj/features/home/presentation/components/home_screen/today_product.dart';
import 'package:thalj/features/home/presentation/screens/Home_body/product_info_screen.dart';

import '../../../domain/repository.dart';
import '../../bloc/orders_bloc/orders_bloc.dart';
import '../../bloc/orders_bloc/orders_event.dart';
import '../../bloc/orders_bloc/orders_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetOrdersDataBloc>(context).add(GetOrdersData());

    return Column(
      children: [
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
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<GetOrdersDataBloc, GetOrdersDataState>(
              builder: (BuildContext context, state) {
                if (state is GetOrdersDataSuccess) {

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.ordersData.length,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 1.3),
                    itemBuilder: (BuildContext context, int index) {
                      return TodayProducts(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => Builder(
                            builder: (BuildContext context) {

                              return BlocProvider<GetOrdersDataBloc>(
                                create: (context) =>
                                    GetOrdersDataBloc(homeRepository: context.read<HomeRepository>()),
                                child: ProductInformationScreen(
                                  id: state.ordersData[index].id,
                                ),
                              );
                            },
                          ))
                          );
                          },
                        location: state.ordersData[index].region,
                        locationTo: state.ordersData[index].regionRecipient,
                        productType: state.ordersData[index].name,

                      );
                    },
                  );
                }


                else if (state is GetOrdersDataFailure) {
                  return Column(
                    children: [
                      SizedBox(height: 250.h,),

                       Center(child: Text(state.errorMessage.toString(),style: regularStyle(fontSize: 20.h),)),
                    ],
                  );
                }
                else {
                  return Column(
                    children: [
                      SizedBox(height: 250.h,),

                      const Center(child: CircularProgressIndicator.adaptive()),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
