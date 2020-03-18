import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/models/reviews_model.dart';
import 'package:tourism/views/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CitiesModel>(create: (_) => CitiesModel()),
        ChangeNotifierProvider<UsersReviews>(create: (_) => UsersReviews()),
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
        initialRoute: '/dashboard',
        routes: {
          '/dashboard': (context) => Dashboard(),
        },
      ),
    );
  }
}




