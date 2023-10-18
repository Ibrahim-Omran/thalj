import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';
import '../../domain/repository.dart';
import '../bloc/drivers_data_bloc/get_drivers_data_bloc.dart';
import '../components/driver_doc_widget.dart';

class DriverDocuments extends StatelessWidget {
  const DriverDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomAppBar(
                title: AppStrings.driverDoc,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocProvider(
                  create: (context) =>
                      GetDriversDataBloc(driverRepository: context.read<DriverRepository>()),child: const DriverDocWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
