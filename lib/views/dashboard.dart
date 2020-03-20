import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/models/reviews_model.dart';
import 'package:tourism/widgets/dashboard_widgets.dart';

class Dashboard extends StatelessWidget {

  static const String DISCOVER = "Discover";
  static const String TRENDS = "Trend";
  static const String MOST_RATED_TOUR = "Most Rated Tour";
  static const String WHAT_PEOPLE_THINK = "What people think about";

  Widget getDivider(String title) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider(thickness: 5)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: "PTSans"),
          ),
        ),
        Expanded(child: Divider(thickness: 5)),
      ],
    );
  }

  List<CityOverview> getDiscoverCities(BuildContext context, String tagHeroSection) {
    final cities = Provider.of<CitiesModel>(context, listen: false);
    List<CityOverview> containers = [];
    for (int index = 0; index < cities.citiesAvailable.length; index++)
      containers.add(CityOverview(index, tagHeroSection));
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: TourismDrawer(),
      body: SafeArea(
        child: Consumer2<CitiesModel, UsersReviews>(
          builder: (context, citiesModel, usersReview, _) => ListView(
            children: <Widget>[
              TopBar(),
              SizedBox(height: 10.0),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: SearchBar(hintText: "What would you like to visit today?",),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      width: double.infinity,
                    ),
                    getDivider(DISCOVER),
                    SizedBox(height: 40),
                    Container(
                      height: 225,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: getDiscoverCities(context, DISCOVER),
                      ),
                    ),
                    getDivider(TRENDS),
                    SizedBox(height: 20),
                    Container(
                      height: 225,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: getDiscoverCities(context, TRENDS),
                        ),
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MOST_RATED_TOUR,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Merriweather"),
                          ),
                        ],
                      ),
                    ),
                    MostRatedCard(city: "Berlin", tagHeroSection: MOST_RATED_TOUR),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 10),
                    MostRatedCard(city: "Tokyo", tagHeroSection: MOST_RATED_TOUR),
                    SizedBox(height: 20),
                    Divider(
                      thickness: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20, left: 15, top: 10),
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            Text(
                              WHAT_PEOPLE_THINK,
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Merriweather"),
                            ),
                          ]),
                    ),
                    ListView.builder(
                      itemCount: usersReview.dashboardReviews.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 20),
                          child: WhatPeopleThinkWidget(
                              usersReview.dashboardReviews[index].name,
                              usersReview.dashboardReviews[index].review,
                              usersReview
                                  .dashboardReviews[index].profilePicture),
                        );
                      },
                    ),
                    Divider(
                      thickness: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
