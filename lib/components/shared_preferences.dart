import 'package:flutter/cupertino.dart';
import 'package:morbicrea/backend/user_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  SharedPreferences _prefs ;



  addUserId(String id) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('UserId', id);
  }
  getUserId() async {
    _prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = _prefs.getString('UserId');
    return stringValue;
  }




  addUserName(String name) async {
     _prefs = await SharedPreferences.getInstance();
     _prefs.setString('UserName', name);

  }


  Future<String> getUserName() async {
    _prefs = await SharedPreferences.getInstance();
    String stringValue = _prefs.getString('UserName');
    return stringValue;
  }

  addUserEmail(String email) async {

    print(email);
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('UserEmail', email);
  }

  getUserEmail() async {
    _prefs = await SharedPreferences.getInstance();
    String stringValue = _prefs.getString('UserEmail');
    return stringValue;
  }


  addUserType(String type) async {

    print(type);
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('UserType', type);
  }

  getUserType() async {
    _prefs = await SharedPreferences.getInstance();
    String stringValue = _prefs.getString('UserType');
    return stringValue;
  }


  addUserToken(String token) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('Token', token);
  }

  getUserToken() async {
    _prefs = await SharedPreferences.getInstance();
    String stringValue = _prefs.getString('Token');
    return stringValue;
  }

  addUserCon() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('con', true);
  }

  getUserCon() async {
    _prefs = await SharedPreferences.getInstance();
    bool boolValue = _prefs.getBool('con');
    return boolValue;
  }





   Future<bool> isConnect() async{
    _prefs = await SharedPreferences.getInstance();
   // print("tesssssssssssssssssssssssst");
    bool con = _prefs.containsKey('con');
    print('55555555555555');
    print(con);
    return con;
  }

  removeValues() async {
   _prefs = await SharedPreferences.getInstance();
    //Remove String
    _prefs.remove("UserId");
    _prefs.remove("UserName");
    _prefs.remove("UserEmail");
    _prefs.remove("Token");
    _prefs.remove("con");
    _prefs.clear();
    print("done");
  }

  getAll() async{
    _prefs = await SharedPreferences.getInstance();


    User data = User("id", "name", "email", "password","type") ;
    data.id = _prefs.getString("UserId");
    data.name = _prefs.getString("UserName");
    data.email = _prefs.getString("UserEmail");
    print(data.email);
  //  data.type = _prefs.getString("UserType");
   // data.token = _prefs.getString("Token");
   // data.code =


  return  data;


  }



}