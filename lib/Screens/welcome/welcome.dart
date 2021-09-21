


import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/welcome/footer.dart';
import 'package:morbicrea/Screens/welcome/jumbotron.dart';
import 'package:morbicrea/Screens/welcome/side_menu.dart';

import 'header.dart';

class  Welcome extends StatefulWidget {
  static String routeName = "/welcome";
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.black,
    endDrawer: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300
      ),
      child: SideMenu(),
    ),
    body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: size.width,
          constraints: BoxConstraints(
            minHeight: size.height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Header(),

              Jumbotron(),

              Footer()

            ],
          ),
        ),
      ),
    ),
  );
  }

}