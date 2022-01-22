import 'package:flutter/material.dart';
import 'package:resto/model/m_restaurant.dart';
import 'package:resto/style/style.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Restaurant restaurant = restaurantFromJson(snapshot.data!);
            return ListView.builder(
                itemCount: restaurant.restaurants.length,
                itemBuilder: (contex, index) {
                  return _buildrestaurantItem(
                      context, restaurant.restaurants[index]);
                });
          } else if (snapshot.hasError) {
            return Text('fail');
          } else {
            return CircularProgressIndicator(
              color: secondaryColor,
            );
          }
        },
      ),
    );
  }
}

Widget _buildrestaurantItem(
    BuildContext context, RestaurantElement restaurant) {
  return Material(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(restaurant.pictureId),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.id),
    ),
  );
}
