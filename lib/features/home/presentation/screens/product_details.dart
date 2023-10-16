import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/features/auth/presentation/components/text_filed.dart';
import 'package:thalj/features/send/bloc/send_bloc.dart';
import 'package:thalj/features/send/bloc/send_bloc.dart';
import 'package:thalj/features/send/data/remote_data_source.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/custom_app_bar_product_info.dart';
import '../../../../core/widgets/custom_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 860.h,
              child: Form(
                key: ProductDetails._formKey,
                child: Column(
                  children: [
                    const CustomAppBar(
                      img: AppAssets.moka,
                      title: AppStrings.productDetails,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocBuilder<SendBloc, SendState>(
                      builder: (context, state) {
                        return MyFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          hint: "",
                          maxLines: 1,
                          readonly: false,
                          title: AppStrings.productName,
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.vaildForm;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    BlocBuilder<SendBloc, SendState>(
                      builder: (context, state) {
                        return MyFormField(
                          controller: priceController,
                          type: TextInputType.text,
                          hint: "",
                          maxLines: 1,
                          readonly: false,
                          title: AppStrings.price,
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.vaildForm;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    BlocBuilder<SendBloc, SendState>(
                      builder: (context, state) {
                        return MyFormField(
                          controller: phoneController,
                          type: TextInputType.text,
                          hint: "",
                          maxLines: 1,
                          readonly: false,
                          title: AppStrings.number,
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.vaildForm;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    BlocConsumer<SendBloc, SendState>(
                      listener: (context, state) {
                        if (state is SuccessSend) {
                          showToast(
                              text: AppStrings.sent,
                              state: ToastStates.success);
                        } else if (state is FailedSend) {
                          showToast(
                              text: AppStrings.unsent,
                              state: ToastStates.error);
                        }
                      },
                      builder: (context, state) {
                        return state is LoadingSend
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                onPressed: () {
                                  BlocProvider.of<SendBloc>(context).add(
                                      SendSubmitted(
                                          nameController.text,
                                          phoneController.text,
                                          priceController.text));
                                },
                                text: AppStrings.send,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
