import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/models/AcceptedOrders.dart';
import '../../../domain/repository.dart';
import '../../bloc/get_offers_bloc/accepted_offers_bloc.dart';
import '../../components/offers/accepted_orders.dart';
import '../../components/profileAppBar.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    // AcceptedOrdersModel? acceptedOrdersModel=;
    BlocProvider.of<AcceptedOffersBloc>(context).add(AcceptedOffersFetched());
    return Scaffold(
      body:  Column(
          children: [
            const ProfileAppBar(),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<AcceptedOffersBloc, GetAcceptedOrdersState>(
              listener: (context,state){
              },
              builder: (context, state) {
                if (state is GetOrdersDataSuccess) {
                  return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 150.h,

                        child: ListView.builder(
                          itemBuilder: (context, index) => buildOffersITem(
                              name: state.ordersData[index].name??''),
                        itemCount: state.ordersData.length,
                        ),
                      ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      );

  }
}
