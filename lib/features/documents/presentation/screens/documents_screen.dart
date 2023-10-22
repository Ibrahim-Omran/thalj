import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/documents/domain/repository.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/document_check_view_body.dart';

class DocumentsCheckScreen extends StatelessWidget {
  const DocumentsCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DocumentCheckingBloc(
            documentRepository: context.read<DocumentRepository>()),
        child: const SafeArea(child: DocumentCheckBiewBody()),
      ),
    );
  }
}