import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/Screens/sign_in/sign_in_screen.dart';
import 'package:morbicrea/admin/ui/profile/profile_screen.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../responsive.dart';
import '../../shared_preferences.dart';


class Jumbotron extends StatelessWidget {

   Jumbotron({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

      return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: !isMobile(context) ? 40 : 0),
                    child: Column(
                      mainAxisAlignment: !isMobile(context) ? MainAxisAlignment
                          .start : MainAxisAlignment.center,
                      crossAxisAlignment: !isMobile(context)
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: <Widget>[
                        if (isMobile(context) )
                          Image.asset(
                            'assets/images/s_1.jpg',
                            height: size.height * 0.5,
                          ),

                        RichText(
                            textAlign: isMobile(context)
                                ? TextAlign.start
                                : TextAlign.start,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'MORBICREA ',
                                      style: TextStyle(
                                          fontSize: isDesktop(context)
                                              ? 64
                                              : 32,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white
                                      )
                                  ),
                                  TextSpan(
                                      text: 'est une communauté pour les esprits créatifs',
                                      style: TextStyle(
                                          fontSize: isDesktop(context)
                                              ? 64
                                              : 32,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white
                                      )
                                  ),
                                ]
                            )
                        ),


                        SizedBox(height: 10),

                        Text(
                          'Apprenez auprès des meilleurs professionnels '
                              'et rejoignez la plus grande communauté pour les créateurs',
                          textAlign: isMobile(context)
                              ? TextAlign.start
                              : TextAlign.start,
                          style: TextStyle(
                              fontSize: isDesktop(context) ? 36 : 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          ),
                        ),

                        SizedBox(height: 10),

                        Wrap(
                          //runSpacing: 20,
                          children: <Widget>[
                            DefaultButton(
                              press: () {

                            },
                              text: "Créez votre compte gratuitement",


                            ),

                            SizedBox(width: 10),

                          ],
                        )
                      ],
                    ),
                  )
              ),

              if (isDesktop(context) || isTab(context))

                Expanded(
                    child: Image.asset(
                      'assets/images/s_1.jpg',
                      height: size.height * 0.5,
                    )
                )
            ],
          )
      );
    }


}


