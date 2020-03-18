import 'package:flutter/material.dart';
import 'package:tourism/models/reviews_model.dart';

class CitiesModel with ChangeNotifier {

  List<City> citiesAvailable = [];

  CitiesModel() {
    citiesAvailable.addAll([
      City(
        name: "Berlin",
        country: "Germany",
        images: ["res/images/travelling.jpg",
          "res/images/Berlin/pic1.jpg",
          "res/images/Berlin/pic2.jpg",
          "res/images/Berlin/pic3.jpg",
          "res/images/Berlin/pic4.jpg",
        ],
        iconFlag: "res/images/flags/Germany.png",
        tours: [
          CityTour(
            titleTour: "Berlin - City Center",
            shortDepth: "Visit the most famous sightseeings.",
            price: 150,
          ),
        ],
        shortDepth: "Enjoy this tour in the Germany capital",
        fullDepth: "Berlin is the capital and largest city of Germany by both area and population. "
            "Its 3,748,148 (2018) inhabitants make it the most populous city proper of the European Union.",
        reviews: [
          User(
              name: "Billie",
              country: "Spain",
              profilePicture: "res/images/propic/Billie.jpg",
              review: "I love Berlin to the moon and back."
          ),
          User(
              name: "Micaela",
              country: "Egypt",
              profilePicture: "res/images/propic/Micaela.jpg",
              review: "I suggest everyone this tour. I appreciated it a lot."
          ),
        ]
      ),

      City(
          name: "Tokyo",
          country: "Japan",
          images: ["res/images/japanese.jpg",
            "res/images/Tokyo/pic1.jpg",
            "res/images/Tokyo/pic2.jpg",
            "res/images/Tokyo/pic3.png",
            "res/images/Tokyo/pic4.jpg",
          ],
          iconFlag: "res/images/flags/Japan.png",
          tours: [
            CityTour(
              titleTour: "Tokyo - City Center",
              shortDepth: "Some famous places.",
              price: 150,
            ),
          ],
          shortDepth: "Discover the Japan capital",
          fullDepth: "Tokyo is one of the 47 prefectures of Japan. The capital of Japan, "
              "it houses the Emperor of Japan and the Japanese government. Tokyo forms part of the Kantō region "
              "on the southeastern side of Japan's main island, Honshu, and includes the Izu and Ogasawara Islands.",
          reviews: [
            User(
                name: "Erika",
                country: "South Africa",
                profilePicture: "res/images/propic/Erika.jpg",
                review: "Tokyo is astonishing. I felt in love with it and I would love to live here."
            ),
            User(
                name: "Marco",
                country: "Switzerland",
                profilePicture: "res/images/propic/Marco.jpg",
                review: "Last week I went to Tokyo and it was the most beautiful experience I had in my life."
            ),
          ]
      ),

      City(
          name: "Amsterdam",
          country: "Netherlands",
          iconFlag: "res/images/flags/Netherlands.png",
          images: ["res/images/amsterdam.jpg",
            "res/images/Amsterdam/pic1.jpg",
            "res/images/Amsterdam/pic2.jpg",
            "res/images/Amsterdam/pic3.jpeg",
            "res/images/Amsterdam/pic4.jpg",
          ],
          tours: [
            CityTour(
              titleTour: "Amsterdam - City Center",
              shortDepth: "Anne Frank's House, Van Gough Museum...",
              price: 200,
            ),
          ],
          shortDepth: "Enjoy this tour in Amsterdam",
          fullDepth: "Amsterdam is the capital and most populous city of the Netherlands with a population of 872,680"
              "within the city proper, 1,380,872 in the urban area and 2,410,960 in the metropolitan area. "
              "Found within the province of North Holland, Amsterdam is colloquially referred to as the \"Venice of the North\""
              ", attributed by the large number of canals which form a UNESCO World Heritage Site.",
          reviews: [
            User(
                name: "John",
                country: "USA",
                profilePicture: "res/images/propic/John.jpg",
                review: "Amsterdam is nice, the weed much more. Ops..."
            ),
            User(
                name: "Shizuka",
                country: "Japan",
                profilePicture: "res/images/propic/Shizuka.jpg",
                review: "Last week I went to Amsterdam and it was the most beautiful experience I had in my life."
            ),
          ]
      ),

      City(
          name: "Barcelona",
          country: "Spain",
          iconFlag: "res/images/flags/Spain.png",
          images: ["res/images/barcellona.jpg",
            "res/images/Barcelona/pic1.jpg",
            "res/images/Barcelona/pic2.jpg",
            "res/images/Barcelona/pic3.jpg",
            "res/images/Barcelona/pic4.jpeg",
          ],
          tours: [
            CityTour(
              titleTour: "Barcelona - City Center",
              shortDepth: "Sagrada Familia, Picasso Museum, La Rambla...",
              price: 200,
            ),
          ],
          shortDepth: "Fall in love with Barcelona",
          fullDepth: "Barcelona is one of the world's leading tourist, economic, trade fair "
              "and cultural centres, and its influence in commerce, education, entertainment, sports, "
              "media, fashion, science, and the arts all contribute to its status as one of the major global cities. "
              "It is a major cultural and economic centre in southwestern Europe, 24th in the world (before Zürich, after Frankfurt) and a financial centre",
          reviews: [
            User(
                name: "Giorgia",
                country: "Italy",
                profilePicture: "res/images/propic/Giorgia.jpg",
                review: "IO SONO GIORGIA SONO UNA DONNA SONO CRISTIANA"
            ),
            User(
                name: "Greta",
                country: "Sweden",
                profilePicture: "res/images/propic/Greta.jpg",
                review: "I finally realized my dream of seeing a FC Barcelona football match. Such an amazing experience!"
            ),
          ]
      ),

      City(
          name: "London",
          country: "England",
          iconFlag: "res/images/flags/UK.png",
          images: ["res/images/london.jpg",
            "res/images/London/pic1.jpg",
            "res/images/London/pic2.jpg",
            "res/images/London/pic3.jpg",
            "res/images/London/pic4.jpg",
          ],
          tours: [
            CityTour(
              titleTour: "London - City Center",
              shortDepth: "Big Ben, British Museum, London Eye...",
              price: 200,
            ),
          ],
          shortDepth: "Take the chance of exploring London",
          fullDepth: "London is the capital and largest city of England and the United Kingdom. "
              "London is considered to be one of the world's most important global cities and has "
              "been called the world's most powerful, most desirable, most influential, most visited, "
              "most expensive, innovative, sustainable, most investment-friendly, and most-popular-for-work city.",
          reviews: [
            User(
                name: "Clarissa",
                country: "USA",
                profilePicture: "res/images/propic/Clarissa.jpg",
                review: "London is perfect for everybody in this world. It offers a wide variety of attractions."
            ),
            User(
                name: "Tania",
                country: "Norwey",
                profilePicture: "res/images/propic/Tania.jpg",
                review: "I mean, look at it. It's sadness and freedom at the same time, joy and pain, feelings are all there. Love u London."
            ),
          ]
      ),

      City(
          name: "Rome",
          country: "Italy",
          iconFlag: "res/images/flags/Italy.png",
          images: ["res/images/rome.jpg",
            "res/images/Rome/pic1.jpg",
            "res/images/Rome/pic2.jpg",
            "res/images/Rome/pic3.jpg",
            "res/images/Rome/pic4.jpg",
          ],
          tours: [
            CityTour(
              titleTour: "Rome - City Center",
              shortDepth: "Colosseum, Trevi Fountain, Spagna Square...",
              price: 200,
            ),
          ],
          shortDepth: "Rome waits for you",
          fullDepth: "Rome is the capital city and a special comune of Italy. "
              "It is the third most populous city in the European Union by population within city limits. "
              "Rome's history spans 28 centuries. While Roman mythology dates the founding of Rome at around 753 BC, "
              "the site has been inhabited for much longer, making it one of the oldest continuously occupied cities in Europe.",
          reviews: [
            User(
                name: "Jane",
                country: "England",
                profilePicture: "res/images/propic/Jane.jpg",
                review: "ROOOOOMAAAA COREEE DE STA CITTÀÀÀÀÀ"
            ),
            User(
                name: "James",
                country: "Turkey",
                profilePicture: "res/images/propic/James.jpg",
                review: "I have no words to describe the beauty of this city. I hope to see you again Rome!"
            ),
          ]
      ),
    ]);
  }
}

class City {

  String name;
  String country;
  String iconFlag;
  List<CityTour> tours;
  List<String> images;
  String shortDepth;
  String fullDepth;
  List<User> reviews;

  City({this.name, this.country, this.images, this.tours, this.iconFlag,
      this.shortDepth, this.fullDepth, this.reviews});

}

class CityTour {
  String titleTour;
  String shortDepth;
  int price;

  CityTour({this.titleTour, this.price, this.shortDepth});
}