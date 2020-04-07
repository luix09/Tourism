import 'package:flutter/material.dart';
import 'package:tourism/widgets/login_page_widgets.dart';

bool _validateCredentials(String username, String password) {
  return (username == "enigmart" && password == "1111") ? true : false;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String wallpaper = "res/wallpaper/login-image.jpg";
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(wallpaper),
            fit: BoxFit.cover
          )
        ),
        child: Form(
          child: Stack(
            children: <Widget>[
              Positioned(child: LogoWidget(), top: (height / 6), left: 25),
              Positioned(
                bottom: height/5,
                left: width / 12,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: height / 2.4,
                  width: width / 1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      EntryWidget(
                        fieldName: "username",
                        hint: "Enter username",
                        editingController: _controllerUsername,
                        icon: Icon(Icons.chevron_right),
                      ),
                      SizedBox(height: 30),
                      EntryWidget(
                        fieldName: "password",
                        hint: "Enter password",
                        editingController: _controllerPassword,
                        icon: Icon(Icons.chevron_right),
                        isObscured: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              "Forgot password?",
                            ),
                            onPressed: (){},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: ButtonBar(
                            children: <Widget>[
                              ValidationButton(
                                validate: _validateCredentials,
                                enteredUsername: _controllerUsername.value.text,
                                enteredPassword: _controllerPassword.value.text,
                                textButton: "Sign in",
                              )
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
