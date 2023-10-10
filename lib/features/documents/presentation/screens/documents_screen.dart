import 'package:flutter/material.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/document_check_view_body.dart';

class DocumentsCheckScreen extends StatelessWidget {
  const DocumentsCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DocumentCheckBiewBody()),
    );
  }
}
