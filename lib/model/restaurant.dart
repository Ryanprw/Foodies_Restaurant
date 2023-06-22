class LocalRestaurant {
  List<Restaurant>? restaurants;

  LocalRestaurant({
    this.restaurants,
  });

  factory LocalRestaurant.fromJson(Map<String, dynamic> json) =>
      LocalRestaurant(restaurants: json['restaurants']);
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });
}

class Menus {
  List<Drink>? foods;
  List<Drink>? drinks;

  Menus({
    this.foods,
    this.drinks,
  });
}

class Drink {
  String? name;

  Drink({this.name});
}
