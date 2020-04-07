import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/logged_user_model.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              "res/logo/beach-logo.jpg",
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Tourism",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35, fontFamily: "Merriweather"),
            ),
          ),
        ],
      ),
    );
  }
}

class ValidationButton extends StatelessWidget {

  final Function validate;
  final String textButton;
  final String enteredUsername;
  final String enteredPassword;

  ValidationButton({
    @required this.validate,
    this.textButton,
    this.enteredPassword,
    this.enteredUsername
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Sign in",
        style: TextStyle(
            fontSize: 17
        ),
      ),
      elevation: 5,
      color: Color(0xFFe89607),
      onPressed: (){
        if(Form.of(context).validate())
          Navigator.pushReplacementNamed(context, '/dashboard');
        else
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Authentication failed"),));
      },
    );
  }
}


class EntryWidget extends StatelessWidget {

  final String fieldName;
  final editingController;
  final String hint;
  final bool isObscured;
  final Icon icon;

  EntryWidget({
    this.fieldName,
    this.editingController,
    this.hint,
    this.icon,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<LoggedUserModel>(context);
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: TextFormField(
          controller: editingController,
          obscureText: isObscured,
          cursorRadius: Radius.circular(20),
          decoration: InputDecoration(
              prefixIcon: icon,
              border: InputBorder.none,
              hintText: hint),
          validator: (value) {
            if(value.isEmpty)
              return 'This field can\'t be empty';
            else if(fieldName == "username") {
              if(loggedUser.nickname == value)
                return null;
            }
            else if(fieldName == "password") {
              if(loggedUser.password == value)
                return null;
            }
            return null;
          },
        ),
      ),
    );
  }
}
