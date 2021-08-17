import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:morbicrea/Screens/forgot_password/forgot_password_screen.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/custom_surfix_icon.dart';
import 'package:morbicrea/components/form_error.dart';
import 'package:morbicrea/components/keyboard.dart';
import 'package:morbicrea/components/size_config.dart';
import 'package:morbicrea/models/user_parm.dart';
import 'package:morbicrea/services/user_service.dart';
import 'package:morbicrea/shared_preferences.dart';

import '../../../components/default_button.dart';


class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();

}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  UserService get service => GetIt.I<UserService>();

  SharedPref pref = SharedPref();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
       // begin

                  UserParam userP =
                  UserParam(email: email, password: password);
                  print(userP.email);
                  final result1 =
                      await service.Login(userP).then((result) async {
                    if (result.data != null) {
                      print("result.data");
                      print(result.data);
                      pref.addUserEmail(result.data.email);
                      pref.addUserName(result.data.name);
                      pref.addUserType(result.data.type);
                      pref.addUserId(result.data.id);
                      pref.addUserCode(result.data.code);
                      pref.addUserPhone(result.data.phone);
                      pref.addUserScore(result.data.score);
                      pref.addHasOrtho(result.data.hasOrtho);
                      print("result.data.hasOrtho");
                      print(result.data.hasOrtho);
                      pref.addUserCon();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen(),
                        ),
                            (route) => false,
                      );
                      /*
                      if (result.data. == "patient") {
                        if (result.data.hasOrtho == "true") {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen(),
                            ),
                                (route) => false,
                          );
                        } else {
                          print('gggggggggggggggggggggg');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => null(),
                            ),
                                (route) => false,
                          );
                        }
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => null(),
                          ),
                              (route) => false,
                        );
                      }
                      */
                    }

                    String
                    text= result.errer ? (result.errorMessage ?? " An errer 1") : 'you are connected';
                    if (result.errer == true) {
                      text = "Address or password incorrect";
                    } else {
                      print("hi getting stutter progress");
                      //   await stutterservice.getStutterProgress(result.data.id);
                      text = 'you are connected';
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Row(children: [
                              Icon(Icons.info, color: Colors.blueAccent),
                              Text(result.errer == true
                                  ? '  Erorr. '
                                  : '  Welcome.  ')
                            ]),
                            content: Text(text));
                      },
                    );
                  });




// end
                KeyboardUtil.hideKeyboard(context);
             //   Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 1) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
