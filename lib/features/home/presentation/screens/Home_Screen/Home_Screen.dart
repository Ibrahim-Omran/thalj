import 'package:flutter/material.dart';

import 'package:thalj/features/home/presentation/screens/Home_Screen/HomeBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'الرئيسيه'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined,), label: 'العروض'),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'حسابى')

        ],
      ),
      body: const HomeBody(),
    );
  }
}
