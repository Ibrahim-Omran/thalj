import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/back_arrow.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.19,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff1F6EC3),
            Color(0xff155293),
            Color(0xff155293),
          ])),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const BackArrow(),
                const Spacer(),
                Column(children: [
                  Text('مرحبا بك',
                      style: boldStyle(color: Colors.white, fontSize: 20)),
                  Text(
                    'احمد',
                    style: boldStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.clip,
                  ),
                ]),
                const SizedBox(
                  width: 5,
                ),
                const Image(
                  image: AssetImage('assets/images/human.png'),
                  height: 60,
                  width: 70,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
