import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/home/presentation/components/customNavbar.dart';

import 'package:thalj/features/home/presentation/screens/Home_Screen/HomeBody.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/offers.dart';
import 'package:thalj/features/home/presentation/screens/Home_Screen/profile.dart';

import '../../../domain/repository.dart';
import '../../bloc/get_offers_bloc/accepted_offers_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    const HomeBody(),
    BlocProvider(
        create: (context) =>
            AcceptedOffersBloc(context.read<OffersRepository>()),
        child: Offers()),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'الرئيسيه'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.local_offer_outlined,), label: 'العروض'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'حسابى')

      //   ],
      // ),
      body: SafeArea(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
