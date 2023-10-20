
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';

import 'package:thalj/features/home/presentation/components/home_screen/today_product.dart';

import '../../bloc/orders_bloc/orders_bloc.dart';
import '../../bloc/orders_bloc/orders_event.dart';
import '../../bloc/orders_bloc/orders_state.dart';
import '../../components/profileAppBar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetOrdersDataBloc>(context).add(GetOrdersData());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ProfileAppBar(),
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
          BlocBuilder<GetOrdersDataBloc, GetOrdersDataState>(
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
                        navigatePushNamed(
                            context: context,
                            route: Routes.productInformationScreen);
                      },
                      location: state.ordersData[index].region,
                      locationTo: state.ordersData[index].regionRecipient,
                      productType: state.ordersData[index].name,
                    );
                  },
                );
              }

              if (state is GetOrdersDataLoading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              if (state is GetOrdersDataFailure) {
                return const Center(child: Text("قم بدفع الاشتراك الشهري لتفعيل الحساب"));
              }
              else {
                return const Text("SERVER ERROR");
              }
            },
          ),
        ],
      ),
    );
  }
}
