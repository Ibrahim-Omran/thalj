import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

void navigatePushNamed({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigatePushReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => appRoutes(route, arg),
    ),
  );
}
