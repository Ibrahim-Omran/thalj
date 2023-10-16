import 'package:flutter/material.dart';

import 'package:thalj/features/auth/presentation/components/text_filed.dart';

import '../../../../core/utils/app_strings.dart';

// ignore: must_be_immutable
class PhoneForm extends StatefulWidget {
  TextEditingController controller = TextEditingController();

  PhoneForm({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

String countryCode = '+20';
String phoneNumber = '';

class _PhoneFormState extends State<PhoneForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButton<String>(
              value: countryCode,
              onChanged: (newValue) {
                setState(() {
                  countryCode = newValue!;
                });
              },
              items: ['+20', '+91', '+44'] // example country codes
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        ),
        Expanded(
          child: MyFormField(
            controller: widget.controller,
            type: TextInputType.phone,
            hint: '000 000 000',
            maxLines: 1,
            readonly: false,
            title: AppStrings.phoneNumber,
            vaild: (value) {
              if (value!.isEmpty) {
                return AppStrings.vaildForm;
              }
              if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                return AppStrings.phoneNumber;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
