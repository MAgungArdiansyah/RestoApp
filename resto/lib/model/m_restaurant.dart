import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(jsonDecode(str));

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
    required this.menu
  });

  RestaurantElement.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'] ?? 'error';
    name = restaurant['name'] ?? 'error';
    description = restaurant['description'] ?? 'error';
    pictureId = restaurant['pictureId'] ?? 'error';
    city = restaurant['city'] ?? 'error';
    rating = restaurant['rating'].toDouble() ?? 0;
    menu = Menu.fromJson(restaurant['menus']);
  }
}

class Menu {
  late List<Foods> foods;
  late List<Drinks> drinks;

  Menu({required this.foods, required this.drinks});

  Menu.fromJson(Map<String, dynamic> menus) {
    foods = List<Foods>.from(menus['foods'].map((food) => Foods.fromJson(food)));
    drinks = List<Drinks>.from(
        menus['drinks'].map((drink) => Drinks.fromJson(drink)));
  }
}

class Foods {
  late String name;
  late String img;
  late double price;

  Foods({required this.name, });

  Foods.fromJson(Map<String, dynamic> foods) {
    name = foods['name'] ?? 'error';
    img = foods['img'] ?? 'error';
    price = foods['price'] ?? 0;
  }
}

class Drinks {
  late String name;
  late String img;
  late double price;

  Drinks({required this.name, required this.img, required this.price});

  Drinks.fromJson(Map<String, dynamic> drinks) {
    //Drinks(name: drinks['name'] ?? 'error');
    name = drinks['name'] ?? 'error';
    img = drinks['img'] ?? 'error';
    price = drinks['price'] ?? 0;
  }
}
