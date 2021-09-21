import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/sign_in/no_account_text.dart';
import 'package:morbicrea/components/size_config.dart';
import 'package:morbicrea/components/socal_card.dart';
import 'package:morbicrea/responsive.dart';

import 'sign_form.dart';

class Body extends StatelessWidget {

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Row(
        children: <Widget>[
          Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: !isMobile(context) ? 20:0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: !isMobile(context) ? MainAxisAlignment.start:MainAxisAlignment.center,
              crossAxisAlignment: !isMobile(context) ? CrossAxisAlignment.start:CrossAxisAlignment.center,
              children: <Widget> [
                if (isMobile(context))
                Image.asset("assets/images/Logo_MorbiCrea.png",width: 200,height: 110),
                SizedBox(height: 10),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: isMobile(context) ? TextAlign.center:TextAlign.start,
                  style: TextStyle(
                    fontSize: isDesktop(context) ? 36 : 18,
                    fontWeight:  FontWeight.w300
                  ),
                ),
                SizedBox(height: 10),
                SignForm(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                NoAccountText(),

                if(isDesktop(context) || isTab(context))
                  Expanded(
                      child:Image.asset("assets/images/Logo_MorbiCrea.png",
                      height: size.height * 0.7,)
                  )

              ],
            ),
          ),
        ),
      ),
    ],
    )

    );
  }
}
