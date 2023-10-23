import 'package:flutter/material.dart';

import '../components/admin_options/admin_options_body..dart';


class AdminOptionsScreen extends StatelessWidget {
  const AdminOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  SafeArea(child: AdminOptionsBody()),

    );
  }
}
