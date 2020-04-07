import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/models/logged_user_model.dart';
import 'package:tourism/widgets/user_page_widgets.dart';

class UserPage extends StatelessWidget {
  final Map<String, int> sections = {
    "Flights": 7,
    "Followers": 120,
    "Reviews": 6
  };

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer2<LoggedUserModel, CitiesModel>(
        builder: (context, user, cities, _) => CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 1,
              expandedHeight: 350,
              centerTitle: true,
              title: Text("Enigmart"),
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(
                                "res/images/propic/codeek.jpg",
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            user.name + ' ' + user.surname,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Find friends",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'More',
                  onPressed: () {},
                )
              ],
            ),
            SliverToBoxAdapter(
                child: Container(
              color: Colors.white,
              child: ButtonBar(
                buttonMinWidth: 100,
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ...List.generate(sections.length, (index) {
                    return UserButton(
                      name: sections.keys.toList()[index],
                      value: sections[sections.keys.toList()[index]],
                    );
                  })
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white10,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "Favourite Places",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if(index >= user.favourites.length) return null;
                return Container(
                  padding: EdgeInsets.only(left: 40),
                  child: ListTile(
                    leading: Image.asset(
                      cities.citiesAvailable[index].iconFlag,
                      scale: 1.2,
                    ),
                    title: Text(
                        user.favourites[index],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    subtitle: Text(
                      "${index+1} month ago"
                    ),
                  ),
                );
              }),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if(index < 7)
                  return Container(height: 90, color: Colors.white);
                return null;
              }),
            )
          ],
        ),
      ),
    );
  }
}
