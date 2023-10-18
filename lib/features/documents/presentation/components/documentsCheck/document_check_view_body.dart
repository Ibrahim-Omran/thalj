import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/widgets/custom_app_bar_product_info.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/custom_button_delivery.dart';

class DocumentCheckBiewBody extends StatefulWidget {
  const DocumentCheckBiewBody({
    super.key,
  });

  @override
  State<DocumentCheckBiewBody> createState() => _DocumentCheckBiewBodyState();
}

class _DocumentCheckBiewBodyState extends State<DocumentCheckBiewBody> {
  @override
  void initState() {
    BlocProvider.of<DocumentCheckingBloc>(context).add(DocumentChecking());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCheckingBloc, DocumentCheckingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: state is DocumentCheckingLoading
              ? Column(
                  children: [
                    const CustomAppBar(
                      title: AppStrings.documentCheck,
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
                        const CustomAppBar(
                          title: AppStrings.documentCheck,
                        ),
                        const Spacer(),
                        Image.asset(state.img),
                        Text(
                          state.title,
                          style: boldStyle(),
                          textAlign: TextAlign.center,
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
                  : null,
        );
      },
    );
  }
}
