import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/utils/app_text_style.dart';
import '../../bloc/get-accepted-offers/acceptedOffers_bloc.dart';
import '../../bloc/get-accepted-offers/acceptedOffers_event.dart';
import '../../bloc/get-accepted-offers/acceptedOffers_state.dart';
import '../../components/offers/accepted_orders.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AcceptedOrderBloc>(context).add(AcceptedOffersFetched());
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [

            BlocConsumer<AcceptedOrderBloc, AcceptedOrdersState>(
              listener: (context,state){
              },
              builder: (context, state) {
                if (state is GetOrdersDataSuccess) {
                  return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.separated(



                        itemBuilder: (context, index) => buildOffersITem(


                          context: context, data: state.ordersData,
                           ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.ordersData.length, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20.h,); },
                      ));
                }
                else if(state is GetOrdersDataFailure)
                  {
                    return Column(
                      children: [
                        SizedBox(height: 300.h,),

                        Center(child: Text( state.errorMessage,style: regularStyle(fontSize: 24.h),)),
                      ],
                    );
                  }

                else {
                  return Column(
                    children: [
                      SizedBox(height: 300.h,),
                      const Center(child: CircularProgressIndicator.adaptive()),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );

  }
}