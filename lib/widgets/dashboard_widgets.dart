import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/views/city_details.dart';
import 'package:tourism/views/settings.dart';
import 'package:tourism/views/user_page.dart';

class TopBar extends StatelessWidget{
  final String pathWallpaper = "res/images/topbar_wallpaper.jpg";
  final String propic = "res/images/propic/codeek.jpg";
  final String appName = "Tourism";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
      height: 220,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Image.asset(pathWallpaper, fit: BoxFit.cover),
              )
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 26.0,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              )),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage())
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                appName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "Merriweather"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: IconButton(
                iconSize: 50,
                icon: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(propic),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserPage())
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TourismDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}

class SearchBar extends StatefulWidget {
  final String hintText;
  SearchBar({this.hintText});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
  with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        cursorRadius: Radius.circular(20),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black38.withOpacity(0.7)),
          hintText: widget.hintText
        ),
      ),
    );
  }
}


class MostRatedCard extends StatelessWidget {
  final String city;
  final String tagHeroSection;

  MostRatedCard({@required this.city, @required this.tagHeroSection});

  Widget showFiveStars() {
    List<Icon> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        Icon(
          Icons.star_border,
          size: 14,
        ),
      );
    }
    return Wrap(
      alignment: WrapAlignment.start,
      children: <Widget>[...stars],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesModel>(builder: (context, mostRatedModel, _) {
      // Obtain the city with the name of "$City"
      final city = mostRatedModel.citiesAvailable
          .where((item) => item.name == this.city)
          .toList()[0];

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CityDetails(
                mostRatedModel.citiesAvailable.indexOf(city),
                tagHeroSection)
            )
          );
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                          spreadRadius: -10,
                          offset: Offset(0.0, 10.0),
                        )
                      ],
                    ),
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Hero(
                        tag: city.name + tagHeroSection,
                        child: Image.asset(
                          city.images[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(10 / 360),
                      child: Container(
                        margin: EdgeInsets.only(right: 40, bottom: 30),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(city.tours[0].price.toString() + '\$',
                            style: TextStyle(
                              fontSize: 35,
                            )),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 70,
                width: double.infinity,
                //decoration: BoxDecoration(
                //    border: Border.all(width: 2, color: Colors.black)),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: showFiveStars(),
                        )),
                    Positioned(
                      top: 32,
                      left: (MediaQuery.of(context).size.width / 2) + 120,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.remove_red_eye, size: 16),
                            Text(
                              " 50k",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        city.tours[0].titleTour,
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      bottom: 14,
                      child: Text(
                        city.tours[0].shortDepth,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class WhatPeopleThinkWidget extends StatelessWidget {
  final String propic;
  final String nickname;
  final String review;

  WhatPeopleThinkWidget(this.nickname, this.review, this.propic);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            minRadius: 30,
            backgroundImage: AssetImage(propic),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    nickname,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  "\"" + review + "\"",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CityOverview extends StatelessWidget {
  final int city;
  final String tagHeroSection;

  CityOverview(this.city, this.tagHeroSection);

  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesModel>(builder: (context, citiesModel, _) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.black38
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 7.0,
                      spreadRadius: -2,
                      offset: Offset(0.0, 4.0),
                    )
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Hero(
                    tag: citiesModel.citiesAvailable[city].name + tagHeroSection,
                    child: Image(
                      image:
                          AssetImage(citiesModel.citiesAvailable[city].images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CityDetails(city, tagHeroSection)));
              },
            ),
            Text(
              "${citiesModel.citiesAvailable[city].name}",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: "PTSans"),
            ),
          ],
        ),
      );
    });
  }
}
