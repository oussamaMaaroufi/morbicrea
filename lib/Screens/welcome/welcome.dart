


import 'package:flutter/material.dart';

class  Welcome extends StatefulWidget {
  static String routeName = "/welcome";
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(icon: Icon( Icons.menu) ,
            onPressed: (){},
          color: Colors.white,
            )
      ],
      leading: IconButton(
        icon: Image.asset("assets/images/Logo_MorbiCrea.png"),
        onPressed: (){},
      ),
          ),
  );
  }

}