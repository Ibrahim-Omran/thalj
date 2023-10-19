import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/home/domain/models/orders_model.dart';
import 'package:thalj/features/home/domain/repository.dart';
import 'package:thalj/features/home/presentation/components/home_screen/today_product.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/functions/saveTokens.dart';
import '../../../data/remote_data_source.dart';
import '../../bloc/orders_bloc/orders_bloc.dart';
import '../../bloc/orders_bloc/orders_state.dart';
import '../../components/profileAppBar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});


  @override
  Widget build(BuildContext context) {
final _model=ModalRoute.of(context)?.settings.arguments as OrdersModel;
List<OrdersModel> orderlist=[_model];

    return BlocProvider(
        create: (context)=>GetOrdersDataBloc(orderRepository: context.read<OrdersRepository>()),
      child: SingleChildScrollView(
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
                      onTap: () {


                      },
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
            BlocConsumer<GetOrdersDataBloc,GetOrdersDataState> (

              builder: (BuildContext context, state) {
                return  GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderlist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing: 1,mainAxisSpacing: 1,
                      childAspectRatio: 1

                  ) ,
                  itemBuilder: (BuildContext context, int index) {

                    return TodayProducts(
                      onTap: () {
                        navigatePushNamed(
                            context: context,
                            route: Routes.productInformationScreen);
                      },
                      location: orderlist[index].region,
                      locationTo: orderlist[index].regionRecipient,
                      productType:orderlist[index].name,
                    );
                  },






                );
              }, listener: (BuildContext context, Object? state) {  },
            ),

          ],
        ),
      ),




    );
  }
}
