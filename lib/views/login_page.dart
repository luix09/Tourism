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

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: Image.asset(wallpaper, fit: BoxFit.cover)),
            Positioned(child: LogoWidget(), top: (height / 6), left: 25),
            Positioned(
              bottom: 30,
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
                      hint: "Username",
                      editingController: _controllerUsername,
                      icon: Icon(Icons.chevron_right),
                    ),
                    SizedBox(height: 40),
                    EntryWidget(
                      hint: "Password",
                      editingController: _controllerPassword,
                      icon: Icon(Icons.chevron_right),
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
    );
  }
}