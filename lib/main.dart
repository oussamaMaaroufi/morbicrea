import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/splash/splash_screen.dart';
import 'package:morbicrea/components/routes.dart';
import 'package:morbicrea/components/theme.dart';

import 'Screens/login_success/login_success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,

    );
  }
}


