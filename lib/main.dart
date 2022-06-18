import 'package:flutter/material.dart';

import 'page/routes/routes.dart';
import 'resources/theme/theme_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeApp.light,
    initialRoute: Routes.home,
    routes: Routes.routes,
  ));
}
