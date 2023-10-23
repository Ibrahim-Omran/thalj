import 'package:flutter/material.dart';

import '../components/admin_options/admin_options_body..dart';


class AdminOptionsScreen extends StatefulWidget {
  const AdminOptionsScreen({super.key});

  @override
  State<AdminOptionsScreen> createState() => _AdminOptionsScreenState();
}


class _AdminOptionsScreenState extends State<AdminOptionsScreen> {


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  SafeArea(child: AdminOptionsBody()),

    );
  }
}
