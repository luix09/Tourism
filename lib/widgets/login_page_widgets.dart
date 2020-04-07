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
                  color: Colors.black, fontWeight: FontWeight.w600, fontSize: 35, fontFamily: "Merriweather"),
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
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: TextFormField(
          controller: editingController,
          obscureText: isObscured,
          cursorRadius: Radius.circular(20),
          decoration: InputDecoration(
              prefixIcon: icon,
              border: InputBorder.none,
              hintText: hint),
          validator: (value) {
            if(fieldName == "username") {
              if(loggedUser.nickname != value)
                return 'invalid username';
            }
            else if(fieldName == "password") {
              if(loggedUser.password != value)
                return 'invalid password';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  SocialIcon({this.colors, this.iconData, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp)),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}