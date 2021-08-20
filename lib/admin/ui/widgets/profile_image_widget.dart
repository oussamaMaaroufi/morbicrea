import 'package:flutter/material.dart';
import 'package:morbicrea/components/shared_preferences.dart';
import 'package:morbicrea/main.dart';


class ProfileImageWidget extends StatelessWidget {
  // Image link (Online)
  final String image =
      'https://cdn4.iconfinder.com/data/icons/e-commerce-181/512/477_profile__avatar__man_-512.png';
  SharedPref _prefs = SharedPref();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:Container(

        width: 40.0,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
          ),
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ) ,
      onTap: (){
        _prefs.removeValues();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyApp()
            ),
                (router) => false
        );

      },
    );

  }
}
