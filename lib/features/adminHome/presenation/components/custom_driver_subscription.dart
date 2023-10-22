import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/adminHome/presenation/bloc/driver_subscription_bloc/driver_subscription_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/models/driver_subscription_model.dart';
import '../bloc/driver_subscription_bloc/driver_subscription_event.dart';
import '../bloc/driver_subscription_bloc/driver_subscription_state.dart';

class CustomDriverSubscription extends StatelessWidget {
  const CustomDriverSubscription(
      {super.key, required this.driverSubscriptionModel});

  final DriverSubscriptionModel driverSubscriptionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 273,
          color: const Color.fromRGBO(224, 232, 255, 0.63),
          child: CachedNetworkImage(
            imageUrl: driverSubscriptionModel.invoice,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                  baseColor: AppColors.primary,
                  highlightColor: AppColors.lightBlue,
                  child: const SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ));
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        BlocBuilder<DriverSubscriptionBloc, DriverSubscriptionState>(
          builder: (BuildContext context, DriverSubscriptionState state) {
            return SizedBox(
                    width: double.infinity,
                    child:  ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF3CC26F))),
                        onPressed: () {
                          BlocProvider.of<DriverSubscriptionBloc>(context).add(
                              AccDriverSubscriptions(
                                  driverSubscriptionModel.id));
                          navigatePushReplacement(
                              context: context, route: Routes.driverInvoices);
                        },
                        child: const Text(
                          'موافقة',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  );
          },
        )
      ],
    );
  }
}
