import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['desciption'],
        pictureId: restaurant['pictureId'],
        city: restaurant['city'],
        rating: restaurant['rating'].toDouble(),
        menus: Menus.fromJson(restaurant['menus']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus,
      };
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Drink> foods;
  List<Drink> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
  //       "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  //     };
}

class Drink {
  Drink({
    required this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //     };
}
