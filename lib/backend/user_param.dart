import 'package:flutter/foundation.dart';

class UserParam{
  String name;
  String email;
  String password;
  String type;
  String token;
  //String birthday;
  String id;


  UserParam({ this.id,
              this.name,
              this.email,
              this.password,
              this.type,
              });

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name": name,
      "email": email,
      "password": password,
      "type": type,

      "token":token,

    };
  }
}