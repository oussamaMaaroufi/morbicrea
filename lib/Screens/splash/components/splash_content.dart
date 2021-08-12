import 'package:flutter/material.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/size_config.dart';



class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Image.asset("assets/images/Logo_MorbiCrea.png",width: 200,height: 110),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(295),
          width: getProportionateScreenWidth(265),
        ),
      ],
    );
  }
}
