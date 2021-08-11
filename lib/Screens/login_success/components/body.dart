import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/components/default_button.dart';
import 'package:morbicrea/components/size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SizedBox(height: SizeConfig.screenHeight * 0.05),
        Image.asset(
          "assets/images/done.jpg",
          height: SizeConfig.screenHeight * 0.5, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),

        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
