import 'package:flutter/material.dart';

class LoggedUserModel extends ChangeNotifier {
  final String name;
  final String surname;
  final String country;
  final List<String> favourites;
  LoggedUserModel({this.name, this.surname, this.country, this.favourites});
}