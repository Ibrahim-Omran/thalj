import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/features/home/domain/repository.dart';
import 'package:thalj/features/home/presentation/bloc/delevired_bloc/delivered_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/models/accepted_OrderModel.dart';
import '../../screens/offer_screen/acc_order_info.dart';

Widget buildOffersITem({ required BuildContext context,required List<AcceptedOrdersModel> data}) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  BlocProvider(
          create: (context) =>DeliveredBloc(homeRepository: context.read<HomeRepository>()),child: AccOrderInfo(data: data,), )));
    },
    child: Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightBlue.withOpacity(.63),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " علي طلبك ",
                style: boldStyle(),
                textAlign: TextAlign.center,
              ),
              Text(
                data[0].name!,
                style: boldStyle(),
                textAlign: TextAlign.center,
              ),
              Text(
                " لقد وافق منتج",
                style: boldStyle(),
                textAlign: TextAlign.center,
              ),



            ],
          ),
          Text(
            "  سوف يتم التواصل معك قريبا",
            style: boldStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          Container(
              width: 150.w,
              height: 40.h,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF3CC16F),
              ),
              child: const Center(
                child: Text(
                  'تم الدفع',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 0.02,
                    letterSpacing: 1,
                  ),
                ),
              )
          ),

        ],
      ),
    ),
  );
}