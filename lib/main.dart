import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:morbicrea/Screens/splash/splash_screen.dart';
import 'package:morbicrea/components/routes.dart';
import 'package:morbicrea/components/theme.dart';

import 'backend/services/user_service.dart';

void setUpLocator() {
  GetIt.I.registerLazySingleton(() => UserService());

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      //home: ProfileScreen(),

    );
  }
}


