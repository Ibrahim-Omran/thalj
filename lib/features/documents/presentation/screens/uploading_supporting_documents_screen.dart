import 'package:flutter/material.dart';
import '../components/uploading_supporting_documents/uploading_supporting_documents_view_body.dart';

class UploadingSupportingDocumentsScreen extends StatelessWidget {
  const UploadingSupportingDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: UploadingSupportingDocumentsViewBody()),
    );
  }
}
