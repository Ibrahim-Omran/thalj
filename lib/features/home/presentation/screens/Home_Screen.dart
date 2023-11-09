import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/home/presentation/bloc/get-accepted-offers/acceptedOffers_bloc.dart';
import 'package:thalj/features/home/presentation/components/customNavbar.dart';

import 'package:thalj/features/home/presentation/screens/offer_screen/offers.dart';
import 'package:thalj/features/home/presentation/screens/profile_screen/profile.dart';

import '../../../../core/local/cash_helper.dart';
import '../../../../core/widgets/logo.dart';
import '../../domain/repository.dart';
import '../bloc/orders_bloc/orders_bloc.dart';
import '../components/profileAppBar.dart';
import 'Home_body/HomeBody.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  String? fullName = CacheHelper.getData(key: 'fullname');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    BlocProvider<GetOrdersDataBloc>(
        create: (context) =>
            GetOrdersDataBloc(homeRepository: context.read<HomeRepository>()),
        child: const HomeBody()),
    BlocProvider<AcceptedOrderBloc>(
        create: (context) =>
            AcceptedOrderBloc(homeRepository: context.read<HomeRepository>()),
        child: const Offers()),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1F6EC3),
                Color(0xff155293),
                Color(0xff155293),
              ],
            ),
          ),
        ),
        title: Stack(
            children:[ ProfileAppBar(
              name: fullName!,
            ),
              const LogoWidget(),
            ]
        ),
        // Other app bar properties and widgets...
      ),



      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(child: _pages.elementAt(_selectedIndex)),
          ],
        ),
      ),
    );
  }
}
