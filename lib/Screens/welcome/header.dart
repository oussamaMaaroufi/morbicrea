import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/Screens/login/login_page.dart';
import 'package:morbicrea/Screens/sign_in/sign_in_screen.dart';
import 'package:morbicrea/admin/ui/profile/profile_screen.dart';
import 'package:morbicrea/components/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../responsive.dart';
import '../../shared_preferences.dart';
import 'menu_item.dart';

class Header extends StatelessWidget {
   Header({
    Key key,
  }) : super(key: key);
  String UserType = "";
  bool con = false;
  SharedPref pref;
  Future<bool> fetchData() =>
      Future.delayed(Duration(microseconds: 3000), () async {
        debugPrint('Step 2, fetch data');
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        pref = SharedPref();
        UserType = _prefs.getString("UserType");
        print( _prefs.getBool("con"));
        con =_prefs.getBool("con");
        return true;
      });
  @override
  Widget build(BuildContext context)=> FutureBuilder(
  future: fetchData(),
  builder: (context, snapshot)  {
  if(snapshot.hasData) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          IconButton(
              alignment: Alignment.topCenter,
              color: Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              }
          ),
          Image.asset(
            'assets/images/Logo_MorbiCrea.png',
            width: 60,
            height: 50,
          ),
          Spacer(),
         // if (!isMobile(context))
            Row(
              children: [
                DefaultButton(
                  text: 'Me connecter',
                  press: () {
                   // Navigator.pushNamed(context, SignInScreen.routeName);
                    print(snapshot.data);
                    print(UserType);
                    if (con == true) {
                      print("tet1");
                      if (UserType == "student") {
                        print("tet2");
                        Navigator.pushNamed(
                            context, HomeScreen.routeName);
                      } else {
                        Navigator.pushNamed(
                            context, ProfileScreen.routeName);
                      }
                    } else {
                      Navigator.pushNamed(
                          context, LoginPage.routeName);
                    }
                  },
                ),
              ],
            ),


        ],
      ),
    );
  } else {
  // We can show the loading view until the data comes back.
  debugPrint('Step 1, build loading widget');
  print("test 5554");
  return Center(
  child: SizedBox(
  child: CircularProgressIndicator(
  backgroundColor: Colors.white,
  ),
  width: 60,
  height: 60,
  ),
  // Padding(
  //   padding: EdgeInsets.all(50 ),
  //  child: Text('Awaiting result...'),
  //   )
  );
  }
  }
  );
}