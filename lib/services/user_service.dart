import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:morbicrea/constants.dart';
import 'package:morbicrea/models/API_response.dart';

import 'package:morbicrea/models/user_info.dart';
import 'package:http/http.dart'as http;
import 'package:morbicrea/models/user_parm.dart';
import 'package:morbicrea/shared_preferences.dart';
class UserService {

  static  const String API = BASE_URL+"users/";

  SharedPref pref = SharedPref();

  Future<APIResponse<List<User>>> getUsersList(){
    //  print("jsonData");
    Uri uri =  Uri.parse(API+"list"); // API+"list"
    print(uri);
    return http.get(uri,headers: headers)
        .then((data) {
        print(data.body);
      if(data.statusCode == 200){
        final Map<String, dynamic> jsonData = json.decode(data.body);
        final users = <User>[];
        pref.addUserToken(jsonData["token"]);
        for(var item in jsonData.values.first ){
          final user = User(
              item['_id'],
              item['name'],
              item['email'],
              item['type'],
              item['password']);
          print(user.id);
          users.add(user);
        }

        return APIResponse<List<User>>(data: users);
      }
      return APIResponse<List<User>>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<List<User>>(errer: true,errorMessage: " An errer 2"));
  }



  Future<APIResponse<User>> Login(UserParam item){
    print(item.email+' '+item.password);
    return http.post(Uri.parse(API+"auth") ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {

      if(data.statusCode == 200){
        final Map<String, dynamic> jsonData = json.decode(data.body);
        var item = jsonData["user"];
        print(item);
        print(jsonData["hasOrtho"]);
        final user = User(
            item['id'],
            item['name'],
            item['email'],
            item['password'],
            item['type'],

            token: jsonData["token"],);
        return APIResponse<User>(data: user);
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " An errer 2"));
  }

  Future<APIResponse<User>> SignUp(UserParam item){
    item.score="0";
    item.phone="null";
    // print(json.encode(item.toJson()));
    return http.post(Uri.parse(API+"register") ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      // print(data.statusCode.toString() );
      if(data.statusCode == 200){

        final Map<String, dynamic> jsonData = json.decode(data.body);
        if(jsonData["message"] != null){
          return APIResponse<User>(errer: true,errorMessage: jsonData["message"]);
        }else {
          var item = jsonData["user"];
          final user = User(
              item['id'],
              item['name'],
              item['email'],
              item['type'],
              item['password'],
              phone: item['phone'],
              score: item['score']);
          return APIResponse<User>(data: user);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }



  Future<APIResponse<User>> Update(UserParam item){
    print(json.encode(item.toJson()));
    return http.post(Uri.parse(API+"update") ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      if(data.statusCode == 200){

        final Map<String, dynamic> jsonData = json.decode(data.body);

        if(jsonData["message"] != null){
          print(jsonData["message"]);
          return APIResponse<User>(errer: true,errorMessage: jsonData["message"]);
        }else {
          var item = jsonData["user"];
          final user = User(
              item['id'],
              item['name'],
              item['email'],
              item['type'],
              item['password'],
              code: item['code'],
              phone: item['phone'],
              score: item['score']
          );
          return APIResponse<User>(data: user);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }




/*
  Future<APIResponse<User>> UpdatePasssword (UserParam item){
    print(json.encode(item.toJson()));
    return http.post(API+"updatePwd" ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      if(data.statusCode == 200){

        final Map<String, dynamic> jsonData = json.decode(data.body);

        if(jsonData["success"] == false){
          print(jsonData["message"]);
          return APIResponse<User>(errer: true,errorMessage: jsonData["message"]);
        }else {

          return APIResponse<User>(errer: false);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }
*/







}