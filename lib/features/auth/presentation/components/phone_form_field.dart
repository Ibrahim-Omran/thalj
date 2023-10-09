import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_text_style.dart';

import '../../../../core/utils/app_strings.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
         Text(
          AppStrings.phoneNumber,
          style: regularStyle(color: AppColors.primary)
        ),
        PhoneFormField(
          textAlign: TextAlign.end,
          showFlagInInput: true,
          defaultCountry: IsoCode.EG,
          shouldFormat: true,
          decoration:  InputDecoration(
            hintText: '504x xxx xxx',

            hintStyle: regularStyle(color:Colors.grey),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}