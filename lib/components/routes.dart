

import 'package:flutter/widgets.dart';
import 'package:morbicrea/Screens/forgot_password/forgot_password_screen.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/Screens/login/login_page.dart';
import 'package:morbicrea/Screens/sign_in/sign_in_screen.dart';
import 'package:morbicrea/Screens/sign_up/sign_up_screen.dart';
import 'package:morbicrea/Screens/splash/splash_screen.dart';
import 'package:morbicrea/Screens/welcome/welcome.dart';
import 'package:morbicrea/admin/ui/profile/profile_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => SplashScreen(),
  Welcome.routeName: (context) => Welcome(),
  LoginPage.routeName: (context) => LoginPage(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName:(context) => ProfileScreen(),


};
