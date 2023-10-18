import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/documents/domain/repository.dart';
import '../bloc/document_checking_bloc/document_checking_bloc.dart';
import '../components/uploading_supporting_documents/uploading_supporting_documents_view_body.dart';

class UploadingSupportingDocumentsScreen extends StatelessWidget {
  const UploadingSupportingDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
          create: (context) =>
              DocumentCheckingBloc(documentRepository: context.read<DocumentRepository>()),
          child: const UploadingSupportingDocumentsViewBody()),
    );
  }
}
