import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  final String name;
  final String image;
  final String tagHeroSection;

  TopImage(this.image, this.name, this.tagHeroSection);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Hero(
          tag: '${name + tagHeroSection}',
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
      SafeArea(
        child: IconButton(
          color: Colors.black87,
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ]);
  }
}

class AvailableTourWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  AvailableTourWidget({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(
          Icons.airplanemode_active,
          size: 30,
        ),
        trailing: IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: () {},
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class CityReviewWidget extends StatelessWidget {
  final String name;
  final String country;
  final String review;
  final String image;

  CityReviewWidget({this.name, this.country, this.review, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          country,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "\"$review\"",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
