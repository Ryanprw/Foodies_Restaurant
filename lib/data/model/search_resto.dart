import 'dart:convert';

LocalSearch localSearchFromJson(String str) => LocalSearch.fromJson(
      json.decode(str),
    );

String localSearchToJson(LocalSearch data) => json.encode(
      data.toJson(),
    );

class LocalSearch {
  LocalSearch({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory LocalSearch.fromJson(Map<String, dynamic> json) => LocalSearch(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
          json["restaurants"].map((x) => Restaurant.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(
          restaurants.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
