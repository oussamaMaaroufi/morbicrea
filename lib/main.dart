import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/Screens/sign_up/sign_up_screen.dart';
import 'package:morbicrea/Screens/splash/splash_screen.dart';
import 'package:morbicrea/admin/ui/profile/profile_screen.dart';
import 'package:morbicrea/components/routes.dart';
import 'package:morbicrea/components/theme.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //initialRoute: SplashScreen.routeName,
      //routes: routes,
     // home: ProfileScreen(),
      home:HomeScreen() ,

    );
  }
}


