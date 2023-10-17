import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../components/profileAppBar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileAppBar(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              "دفع الاشتراكات الشهرية",
              style: boldStyle(),
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
