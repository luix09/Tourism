import 'package:flutter/material.dart';

class UsersReviews with ChangeNotifier {
  List<User> dashboardReviews = [];

  UsersReviews() {
    dashboardReviews.addAll([
      User(
        name: "Mohammed",
        country: "Arabia",
        profilePicture: "res/images/propic/man1.jpg",
        review: "Tourism has helped me to find the best place to spend this summer.",),
      User(
        name: "Federick",
        country: "Russia",
        profilePicture: "res/images/propic/man2.jpg",
        review: "Tourism is the best app I\'ve ever used! I just booked a new flight for tomorrow.",),
      User(
        name: "Luisanna",
        country: "Poland",
        profilePicture: "res/images/propic/woman2.jpg",
        review: "I visited London last week. I was so impressed by the organization of the tour.",),
      User(
        name: "Francesca",
        country: "France",
        profilePicture: "res/images/propic/woman1.jpeg",
        review: "Thank you Tourism! I just realized my dream of visiting Barcelona.",),
    ]);
  }
}

class User {
  String name;
  String country;
  String profilePicture;
  String review;

  User({this.name, this.country, this.profilePicture, this.review});
}