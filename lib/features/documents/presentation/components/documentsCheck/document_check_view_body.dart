import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/custom_button_delivery.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/custom_documents_appbar.dart';

import '../../../../../core/utils/app_assets.dart';

class DocumentCheckBiewBody extends StatefulWidget {
  const DocumentCheckBiewBody({
    super.key,
  });

  @override
  State<DocumentCheckBiewBody> createState() => _DocumentCheckBiewBodyState();
}


class _DocumentCheckBiewBodyState extends State<DocumentCheckBiewBody> {
  late bool isLoading = true;
  void delay() {
    Timer(const Duration(seconds: 3),()  {
  setState(() {
  isLoading = false;
  });

  print(isLoading.toString());
  });
}
  @override
  void initState() {

     delay();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: isLoading?


      Column(
        children: [
          CustomAppBarDocumentsCheck(
            title: AppStrings.documentCheck,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Image.asset(AppAssets.loadingChecking),
          Text(
            AppStrings.pleaseWait,
            style: boldStyle(),
          ),
          Text(
            AppStrings.ourTeamChecking,
            style: regularStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomButtonDelivery(
            onPressed: () {},
            text: AppStrings.startDelivery,
            loading: isLoading,
          ),
        ],
      ):
      Column(
        children: [
          CustomAppBarDocumentsCheck(
            title: AppStrings.documentCheck,
            onTap: () {},
          ),
          const Spacer(),
          Image.asset(AppAssets.doneChecking),
          Text(
            AppStrings.doneChecking,
            style: boldStyle(),
            textAlign: TextAlign.center,

          ),
          Text(
            AppStrings.congratulation,
            style: regularStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomButtonDelivery(
            onPressed: () {},
            text: AppStrings.startDelivery,
            loading: isLoading,
          ),
        ],
      ),
    );
  }
}
