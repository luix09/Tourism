import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/cities_model.dart';
import 'package:tourism/widgets/city_details_wdgets.dart';

class CityDetails extends StatefulWidget {
  final int city;
  final String tagHeroSection;

  CityDetails(this.city, this.tagHeroSection);

  @override
  _CityDetailsState createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  Widget _imageSelector({int index, List<String> imagesList}) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double rightValue = 1;

        if (_pageController.position.haveDimensions) {
          rightValue = _pageController.page - index + 1;
          rightValue = (1 - (rightValue.abs() * 0.5)).clamp(0.0, 1.1);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(rightValue) * 520.0,
            width: Curves.easeOut.transform(rightValue) * 450.0,
            child: widget,
          ),
        );
      },
      child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 500,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: -1
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image(
                            image: AssetImage(imagesList[index]),
                            height: 220.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 15,
                              left: 20,
                              child: Text(
                                  "City beauty",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child: Text(
                                  "Example of place to visit",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15
                                  ),
                                ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CitiesModel>(
        builder: (context, citiesModel, _) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopImage(
                    citiesModel.citiesAvailable[widget.city].images[0],
                    citiesModel.citiesAvailable[widget.city].name,
                    widget.tagHeroSection,
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -40, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25, top: 20, right: 15),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "${citiesModel.citiesAvailable[widget.city].name}, "
                                    "${citiesModel.citiesAvailable[widget.city].country}",
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  citiesModel.citiesAvailable[widget.city].iconFlag,
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 15),
                          child: Text(
                            citiesModel.citiesAvailable[widget.city].fullDepth,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                          child: Text(
                            "Popular Places",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(
                          height: 350.0,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: citiesModel.citiesAvailable[widget.city].images.length - 1,
                            itemBuilder: (BuildContext context, index) {
                              return _imageSelector(
                                  index: index + 1,
                                  imagesList: citiesModel.citiesAvailable[widget.city].images);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          child: Text(
                            "Available Tours",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: citiesModel.citiesAvailable[widget.city].tours
                              .length,
                          itemBuilder: (context, index) {
                            final tours = citiesModel.citiesAvailable[this.widget.city]
                                .tours;
                            return AvailableTourWidget(
                              title: tours[index].titleTour,
                              subtitle: tours[index].shortDepth,
                            );
                          },
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          child: Text(
                            "Reviews from users...",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: citiesModel.citiesAvailable[widget.city].reviews.length,
                          itemBuilder: (context, index) {
                            final reviews = citiesModel.citiesAvailable[this.widget.city].reviews;
                            return CityReviewWidget(
                              name: reviews[index].name,
                              country: reviews[index].country,
                              review: reviews[index].review,
                              image: reviews[index].profilePicture,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
