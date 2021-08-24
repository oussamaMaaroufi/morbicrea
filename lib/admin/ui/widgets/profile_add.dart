import 'package:flutter/material.dart';
import 'package:morbicrea/admin/utils/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ProfileAddCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:InkWell(
        onTap: (){
          print("dc");
          _openPopup(context);
        },
        child:  Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: AppTheme.addCardColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
  _openPopup(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Category Name',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'description',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
