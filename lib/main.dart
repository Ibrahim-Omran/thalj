import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/errors/internetCheck.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkInfoImpl().checkInternet();
  runApp( const MyApp());
}

