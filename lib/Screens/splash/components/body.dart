import 'package:flutter/material.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/Screens/sign_in/sign_in_screen.dart';
import 'package:morbicrea/Screens/welcome/welcome.dart';
import 'package:morbicrea/admin/ui/profile/profile_screen.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/default_button.dart';
import 'package:morbicrea/components/shared_preferences.dart';
import 'package:morbicrea/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';


// This is the best practice
import '../components/splash_content.dart';


class  Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Morbicrea, Let’s learn!",
      "image": "assets/images/s_1.jpg"
    },
    {
      "text": "Find the best courses \nin all kind of categories",
      "image": "assets/images/557.jpg"
    },
    {
      "text": "Achieve online certifications \nJust stay at home with us",
      "image": "assets/images/585.jpg"
    },
  ];

  @override
  Widget   build(BuildContext context){

        return SafeArea(
          child: SizedBox(
            //width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) =>
                          SplashContent(
                            image: splashData[index]["image"],
                            text: splashData[index]['text'],
                          ),
                    ),
                  ),

                ),
                Container(
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                                  (index) => buildDot(index: index),
                            ),
                          ),
                          Spacer(flex: 3),
                          DefaultButton(
                            text: "Continue",
                            press: () {
                         /*     print(snapshot.data);
                              print(UserType);
                              if (con == true){
                                print("tet1");
                              if (UserType == "student") {

                                print("tet2");
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              } else {
                                Navigator.pushNamed(
                                    context, ProfileScreen.routeName );
                              }
                              } else {
                                Navigator.pushNamed(
                                    context, SignInScreen.routeName);
                              }*/
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );


  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
