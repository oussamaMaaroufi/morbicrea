import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:morbicrea/backend/user_info.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/shared_preferences.dart';
import 'package:morbicrea/backend/API_response.dart';
import '../user_param.dart';
class UserService {

  static const API = BASE_URL+"users/";

  SharedPref pref = SharedPref();

  Future<APIResponse<List<User>>> getUsersList(){
    //  print("jsonData");
    const uri = API+"list";
    return http.get(Uri.parse(uri))
        .then((data) {
      //  print(data);
      if(data.statusCode == 200){
        final Map<String, dynamic> jsonData = json.decode(data.body);
        final users = <User>[];
        pref.addUserToken(jsonData["token"]);
        for(var item in jsonData.values.first ){
          final user = User(
              item['_id'],
              item['name'],
              item['email'],
              item['password'],
              item['type']
              );
          users.add(user);
        }

        return APIResponse<List<User>>(data: users);
      }
      return APIResponse<List<User>>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<List<User>>(errer: true,errorMessage: " An errer 2"));
  }



  Future<APIResponse<User>> Login(UserParam item){
    //print(item.email+' '+item.password);
    return http.post(Uri.parse(API+"auth") ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {

      if(data.statusCode == 200){
        final Map<String, dynamic> jsonData = json.decode(data.body);
        var item = jsonData["user"];
        print(item);
        // print(jsonData["hasOrtho"]);
        final user = User(
            item['id'],
            item['name'],
            item['email'],
            item['password'],
            item['type'],
            token: jsonData["token"],
            );
        return APIResponse<User>(data: user);
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " An errer 2"));
  }

  Future<APIResponse<User>> SignUp(UserParam item){

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
          print(item);
          final user = User(
              item['id'],
              item['name'],
              item['email'],
              item['password'],
              item['type']
              );
          return APIResponse<User>(data: user);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }
/*
  Future<APIResponse<User>> SignUpAdmin(UserParam item){
    print(json.encode(item.toJson()));
    return http.post(API+"registerAdmin" ,headers: headers,body: json.encode(item.toJson()))
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

              );
          return APIResponse<User>(data: user);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }
*/
  Future<APIResponse<User>> Update(UserParam item){
    print(json.encode(item.toJson()));
    return http.post(Uri.parse(API+"update"),headers: headers,body: json.encode(item.toJson()))
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
              item['password'],
              item['type'],

          );
          return APIResponse<User>(data: user);
        }
      }
      return APIResponse<User>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<User>(errer: true,errorMessage: " Opps server Errer"));
  }
/*
  Future<APIResponse<User>> Approuve(OrthoParam item){
    print(json.encode(item.toJson()));
    return http.post(BASE_URL+"hasOrth/"+"update" ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      if(data.statusCode == 200){

        final Map<String, dynamic> jsonData = json.decode(data.body);

        if(jsonData["success"] != null){
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

/*
  Future<APIResponse<OrthoParam>> getPatient(OrthoParam item){
    // print(json.encode(item.toJson()));
    return http.post(BASE_URL+"hasOrth/"+"getPatient" ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      // print(data.statusCode.toString() );
      List<OrthoParam>  list = <OrthoParam>[];
      if(data.statusCode == 200){

        Map<String, dynamic> jsonData = json.decode(data.body);

        // print(jsonData);

        for(var item in jsonData.values.last ){

          //  print("item");
          //  print(item);


          OrthoParam orthoParam = OrthoParam(
              valid: item["valid"],
              id: item["_id"],
              idOrtho: item['idOrtho'],
              idP: item["idP"],
              nameP: item["nameP"]
          );

          list.add(orthoParam);

        }
        return APIResponse<OrthoParam>(data1: list,errer: false);
      }else {

        return APIResponse<OrthoParam>(errer: true);
      }

      return APIResponse<OrthoParam>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<OrthoParam>(errer: true,errorMessage: " Opps server Errer"));
  }
*/
  /*
  Future<List<Exercice>> getAllExercice(){
    return  http.get(BASE_URL+"exercices/list",headers: headers)
        .then((data) {
      print(data.statusCode.toString() );
      if(data.statusCode == 200){
        Map<String, dynamic> jsonData = json.decode(data.body);
        print(jsonData);
        List<Exercice>  list = <Exercice>[];

        for(var item in jsonData.values.last ){
          print("item");
          Exercice exercice = Exercice(
              category: item["category"],
              id: item["_id"],
              type: item['type'],
              score: item["score"],
              name: item["name"],
              niveau :item["niveau"]
          );
          print(exercice.id);
          print(exercice.name);
          print(exercice.type);
          print(exercice.category);
          print(exercice.niveau);
          print(exercice.score);

          list.add(exercice);
        }
        print(list.length);
        return list ;
        print("");
      }else {

        return APIResponse<Exercice>(errer: true);
      }

      return APIResponse<OrthoParam>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<Exercice>(errer: true,errorMessage: " Opps server Errer"));
  }




  Future<APIResponse<ToDoParam>> addToDo(ToDoParam item){
    item.AvgScore ="0";
    print(json.encode(item.toJson()));
    return http.post(BASE_URL+"todo/"+"add" ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      print(data.body);
      if(data.statusCode == 200){


        final Map<String, dynamic> jsonData = json.decode(data.body);
        print(jsonData["success"]);
        if(jsonData["success"] == false){
          print(jsonData["success"]);
          return APIResponse<ToDoParam>(errorMessage : jsonData["message"], errer: true);
        }else {
          var item = jsonData["todo"];
          print(item);
          final todo = ToDoParam(
              id: item['_id'],
              AvgScore: item['AvgScore'],
              idExercice: item['idExercice'],
              idUser: item['idUser']
          );
          return APIResponse<ToDoParam>(data: todo, errer: false);
        }
      }
      return APIResponse<ToDoParam>(errer: true,errorMessage: " An errer 1");
    }).catchError((_) =>  APIResponse<ToDoParam>(errer: true,errorMessage: " Opps server Errer"));
  }

  Future<List<ToDoParam>> getToDoByIdUser(ToDoParam user){

    //  print(json.encode(item.toJson()));
    var parm ={"idUser" :user.idUser};
    //  print(json.encode(parm));
    return http.post(BASE_URL+"todo/getByIdUser" ,headers: headers,body: json.encode(user.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      // print(data.body);
      List<ToDoParam>  list = <ToDoParam>[];
      if(data.statusCode == 200){

        Map<String, dynamic> jsonData = json.decode(data.body);

        // print(jsonData);

        for(var item in jsonData.values.last ){

          print("item");
          print(item);

          ToDoParam done = ToDoParam(
              id: item["_id"],
              idUser: item["idUser"],
              idExercice: item["idExercice"],
              AvgScore: item["AvgScore"]
          );

          list.add(done);
        }


      }
      return list;
    });

  }



  Future<bool> deleteToDo(ToDoParam item){
    print(json.encode(item.toJson()));
    return http.post(BASE_URL+"todo/"+"delete" ,headers: headers,body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      if(data.statusCode == 200){

        final Map<String, dynamic> jsonData = json.decode(data.body);

        if(jsonData["success"] != null){
          print(jsonData["message"]);
          return true;
        }else {

          return  false;
        }
      }
      return false;
    });
  }

  Future<List<ToDoParam>> getAllToDo(){

    return http.get(BASE_URL+"todo/list" ,headers: headers)
        .then((data) {
      print(data.statusCode.toString() );
      // print(data.body);
      List<ToDoParam>  list = <ToDoParam>[];
      if(data.statusCode == 200){

        Map<String, dynamic> jsonData = json.decode(data.body);

        // print(jsonData);

        for(var item in jsonData.values.last ){

          //  print("item");
          //  print(item);

          ToDoParam done = ToDoParam(
              id: item["_id"],
              idUser: item["idUser"],
              idExercice: item["idExercice"],
              AvgScore: item["AvgScore"]
          );

          list.add(done);
        }


      }
      return list;
    });

  }




  Future<List<ToDoParam>> getToDoByIdOrtho(ToDoParam user){

    //  print(json.encode(item.toJson()));
    var parm ={"idOrtho" :user.idOrtho};
    //  print(json.encode(parm));
    return http.post(BASE_URL+"todo/getByIdOrtho" ,headers: headers,body: json.encode(user.toJson()))
        .then((data) {
      print(data.statusCode.toString() );
      // print(data.body);
      List<ToDoParam>  list = <ToDoParam>[];
      if(data.statusCode == 200){

        Map<String, dynamic> jsonData = json.decode(data.body);

        // print(jsonData);

        for(var item in jsonData.values.last ){

          print("item");
          print(item);

          ToDoParam todoP = ToDoParam(
            id: item["_id"],
            idUser: item["idUser"],
            idExercice: item["idExercice"],
            AvgScore: item["AvgScore"],
            idOrtho:item["idOrtho"],
          );

          list.add(todoP);
        }


      }
      return list;
    });

  }
*/
  Future<APIResponse<User>> UpdatePasssword (UserParam item){
    print(json.encode(item.toJson()));
    return http.post(Uri.parse(API +"updatePwd") ,headers: headers,body: json.encode(item.toJson()))
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










}