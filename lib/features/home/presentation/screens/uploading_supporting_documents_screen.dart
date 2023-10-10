import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/back_button.dart';
import '../components/uploading_supporting_documents/uploading_supporting_documents_view_body.dart';

class UploadingSupportingDocumentsScreen extends StatelessWidget {
  const UploadingSupportingDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: CustomBackButton(
              onTap: () {},
            ),
          )),
      body: const UploadingSupportingDocumentsViewBody(),
    ));
  }
}
