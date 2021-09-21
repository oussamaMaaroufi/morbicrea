import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/splash/components/body.dart';
import 'package:morbicrea/Screens/welcome/side_menu.dart';
import 'package:morbicrea/components/size_config.dart';


class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(

    );
  }
}
