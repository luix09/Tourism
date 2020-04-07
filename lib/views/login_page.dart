import 'package:flutter/material.dart';
import 'package:tourism/widgets/custom_icons.dart';
import 'package:tourism/widgets/login_page_widgets.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String wallpaper = "res/wallpaper/login-image.jpg";
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    precacheImage(AssetImage(wallpaper), context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(wallpaper), fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Positioned(child: LogoWidget(), top: (height / 6), left: 25),
              Positioned(
                bottom: height / 5,
                left: width / 12,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: height / 2.2,
                  width: width / 1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      EntryWidget(
                        fieldName: "username",
                        hint: "Enter username",
                        icon: Icon(Icons.chevron_right),
                      ),
                      SizedBox(height: 30),
                      EntryWidget(
                        fieldName: "password",
                        hint: "Enter password",
                        icon: Icon(Icons.chevron_right),
                        isObscured: true,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Row(
                            children: <Widget>[
                              ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SocialIcon(
                                    colors: [Colors.blue, Colors.blue],
                                    iconData: CustomIcons.facebook,
                                    onPressed: () {},
                                  ),
                                  SocialIcon(
                                    colors: [Colors.red, Colors.red],
                                    iconData: CustomIcons.googlePlus,
                                    onPressed: () {},
                                  ),
                                  SocialIcon(
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.lightBlueAccent
                                    ],
                                    iconData: CustomIcons.twitter,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              FlatButton(
                                textColor: Colors.black,
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ButtonBar(
                          children: <Widget>[
                            ValidationButton(
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
