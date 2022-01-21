import 'dart:convert';



Restaurant restaurantFromJson(String str) => Restaurant.fromJson(jsonDecode(str));

class Restaurant {
  late List<RestaurantElement> restaurants;

  Restaurant({required this.restaurants});

  Restaurant.fromJson(Map<String, dynamic> resto) {
    restaurants = List<RestaurantElement>.from(resto['restaurants']
        .map((restaurant) => RestaurantElement.fromJson(restaurant)));
  }
}

class RestaurantElement {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menu menu;

  RestaurantElement({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  RestaurantElement.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'] ?? 'error';
    name = restaurant['name'] ?? 'error';
    description = restaurant['description'] ?? 'error';
    pictureId = restaurant['pictureId'] ?? 'error';
    city = restaurant['city'] ?? 'error';
    rating = restaurant['rating'].toDouble() ?? 0;
  }
}

class Menu {
  late List<Foods> foods;
  late List<Drinks> drinks;

  Menu({required this.foods, required this.drinks});

  Menu.fromJson(Map<String, dynamic> menu) {
    foods = List<Foods>.from(menu['foods'].map((food) => Foods.fromJson(food)));
    drinks =
        List<Drinks>.from(menu['drinks'].map((drink) => Drinks.fromJson(drink)));
  }
}

class Foods {
  late String name;

  Foods({required this.name});

  Foods.fromJson(Map<String, dynamic> foods) {
    name = foods['name'];
  }
}

class Drinks {
  late String name;

  Drinks({required this.name});

  Drinks.fromJson(Map<String, dynamic> drinks) {
    name = drinks['name'];
  }
}
