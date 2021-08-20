import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:morbicrea/Screens/splash/splash_screen.dart';
import 'package:morbicrea/components/routes.dart';
import 'package:morbicrea/components/theme.dart';
import 'package:morbicrea/services/user_service.dart';


void setupLocator() {
  GetIt.I.registerLazySingleton(() => UserService());
}



void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  UserService get service => GetIt.I<UserService>();

  @override
  Widget build(BuildContext context) {
    service.getUsersList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
     // home: ProfileScreen(),
      home:SplashScreen() ,

    );
  }
}


