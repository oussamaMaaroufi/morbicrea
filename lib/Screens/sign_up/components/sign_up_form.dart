import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:morbicrea/Screens/home/home_screen.dart';
import 'package:morbicrea/components/constants.dart';
import 'package:morbicrea/components/custom_surfix_icon.dart';
import 'package:morbicrea/components/default_button.dart';
import 'package:morbicrea/components/form_error.dart';
import 'package:morbicrea/components/shared_preferences.dart';
import 'package:morbicrea/components/size_config.dart';
import 'package:morbicrea/models/user_parm.dart';
import 'package:morbicrea/services/user_service.dart';



class SignUpForm extends StatefulWidget {
  String name;
  String email;
  String password;
  String conform_password;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UserService get service => GetIt.I<UserService>();
  SharedPref pref = SharedPref();
  bool remember = false;
  final List<String> errors = [];

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
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (!_formKey.currentState.validate()) return ;
                _formKey.currentState.save();
                // if all are valid then go to success screen
                UserParam userP =
                UserParam(name: widget.name,email: widget.email, password: widget.password,type: "student");
                final result = await service.SignUp(userP);
                if(result.data != null ){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                              children:[
                                Icon(Icons.info,color: Colors.blueAccent),
                                Text('  Info. ')
                              ]
                          ),
                          content: Text("You must login with your account"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("YES"),
                              onPressed: () {
                                //Put your code here which you want to execute on Yes button click.
                                Navigator.of(context).pop();
                                print('ok');
                                Navigator.pushNamed(context, HomeScreen.routeName);
                              },
                            ),
                          ],
                        );
                      }
                  );
                }
                else {
                  final text = result.errorMessage;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Error"),
                          content: Text(text)
                      );
                    },
                  );
                }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => widget.name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.keyboard_outlined),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => widget.conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && widget.password == widget.conform_password) {
          removeError(error: kMatchPassError);
        }
        widget.conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((widget.password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => widget.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 5) {
          removeError(error: kShortPassError);
        }
        widget.password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 5) {
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
      onSaved: (newValue) => widget.email = newValue,
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
