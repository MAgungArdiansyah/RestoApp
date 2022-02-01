import 'package:flutter/material.dart';
import 'package:resto/model/m_restaurant.dart';
import 'package:resto/screen/accountpage/account_page.dart';
import 'package:resto/screen/detailpage/detail_page.dart';
import 'package:resto/screen/homepage/widget/custom_dialog.dart';
import 'package:resto/screen/homepage/widget/head.dart';
import 'package:resto/screen/homepage/widget/loading.dart';
import 'package:resto/style/style.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.99),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    //pinned: true,
                    elevation: 0,
                    snap: false,
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: secondaryColor,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const CustomDialogHome(
                                  header: 'Cooming Soon',
                                  detail: 'Stay tune guys',
                                  lottie: 'assets/json/coming_soon.json'));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: secondaryColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AccountPage.routeName);
                        },
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Head(),
                    ),
                  ),
                ];
              },
              body: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/local_restaurant.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final Restaurant restaurant =
                        restaurantFromJson(snapshot.data!);
                    return ListView.builder(
                        
                        itemCount: restaurant.restaurants.length,
                        itemBuilder: (contex, index) {
                          return _buildRestauransItems(
                              context, restaurant.restaurants[index]);
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error can\'t find the data',
                        style: lightTheme.headline6,
                      ),
                    );
                  } else {
                    return const Loading();
                  }
                },
              ))),
    );
  }
}

Widget _buildRestauransItems (BuildContext context, RestaurantElement restaurant) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:8),
    child: ListTile(

        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            restaurant.pictureId, 
            height: 200,
            width: 100, 
            fit: BoxFit.cover
          ),
        ),
        title: Text(
          restaurant.name,
          style: darkTheme.subtitle1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: secondaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurant.city,
                  style: darkTheme.subtitle2,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.stars,
                  color: secondaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurant.rating.toString(),
                  style: darkTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,
         visualDensity: const VisualDensity(vertical: 3),
        onTap: () {
          Navigator.pushNamed(context, DeatailPage.routeName, arguments: restaurant);
        },
      ),
  );
}

