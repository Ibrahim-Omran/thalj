import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';
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
              const DriverDocWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
