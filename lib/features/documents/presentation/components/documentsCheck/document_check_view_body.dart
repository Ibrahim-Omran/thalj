import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/custom_button_delivery.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/custom_documents_appbar.dart';

class DocumentCheckBiewBody extends StatelessWidget {
  const DocumentCheckBiewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCheckingBloc, DocumentCheckingState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: state is DocumentCheckingLoading
                ? Column(
                    children: [
                      CustomAppBarDocumentsCheck(
                        title: AppStrings.documentCheck,
                        onTap: () {},
                      ),
                      const Spacer(),
                      Image.asset(state.img),
                      Text(
                        state.title,
                        style: boldStyle(),
                      ),
                      Text(
                        state.desc,
                        style: regularStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      CustomButtonDelivery(
                        onPressed: () {},
                        text: AppStrings.startDelivery,
                        loading: state.loading,
                      ),
                    ],
                  )
                : state is DocumentCheckingSuccess
                    ? Column(
                        children: [
                          CustomAppBarDocumentsCheck(
                            title: AppStrings.documentCheck,
                            onTap: () {},
                          ),
                          const Spacer(),
                          Image.asset(state.img),
                          Text(
                            state.title,
                            style: boldStyle(),
                          ),
                          Text(
                            state.desc,
                            style: regularStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          CustomButtonDelivery(
                            onPressed: () {},
                            text: AppStrings.startDelivery,
                            loading: state.loading,
                          ),
                        ],
                      )
                    : null);
      },
    );
  }
}
