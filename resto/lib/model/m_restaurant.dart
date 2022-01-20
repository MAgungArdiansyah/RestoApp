import 'dart:convert';

class Restaurant{
  late List<RestaurantElement> restaurants;

  Restaurant({
    required this.restaurants
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurants = json["restaurants"] ?? 'error';
  }
  

}

class RestaurantElement {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
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
    rating = restaurant['rating'] ?? 'error';
  }

  
}

class Menu {

  late Foods foods;
  late Drinks drinks;

  Menu({
    required this.foods,
    required this.drinks
  });

  Menu.fromJson(Map<String, dynamic> menu){
    foods = Foods.fromJson(menu['foods']);
    drinks = Drinks.fromJson(menu['driks']);
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

List<RestaurantElement> parseResto(String? json) {
    if (json == null) {
      return [];
    }

    final List parsed = jsonDecode(json);
    return parsed.map((json) => RestaurantElement.fromJson(json)).toList();
}