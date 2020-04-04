import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/models/logged_user_model.dart';
import 'package:tourism/models/reviews_model.dart';
import 'package:tourism/views/dashboard.dart';
import 'package:tourism/views/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("res/wallpaper/login-image.jpg"), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CitiesModel>(create: (_) => CitiesModel()),
        ChangeNotifierProvider<UsersReviews>(create: (_) => UsersReviews()),
        ChangeNotifierProvider<LoggedUserModel>(create: (_) => LoggedUserModel(
            name: "Luigi",
            surname: "Cuomo",
            country: "Italy"))
      ],
      child: MaterialApp(
        title: 'Tourism',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/dashboard': (context) => Dashboard(),
        },
      ),
    );
  }
}




