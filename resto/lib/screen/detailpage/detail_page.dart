import 'package:flutter/material.dart';
import 'package:resto/model/m_restaurant.dart';
import 'package:readmore/readmore.dart';
import 'package:resto/screen/detailpage/widget/header.dart';
import 'package:resto/screen/loginregister/widget/custom_dialog.dart';
import 'package:resto/style/style.dart';

class DeatailPage extends StatelessWidget {
  final RestaurantElement restaurantElement;
  static const routeName = '/detail_page';

  const DeatailPage({Key? key, required this.restaurantElement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      height: _size.height,
      width: _size.width,
      child: Stack(
        children: [
          Hero(
            tag: restaurantElement.pictureId,
            child: Image(
              image: NetworkImage(
                restaurantElement.pictureId,
              ),
              height: _size.height * 0.4,
              width: _size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 26.0, bottom: 16),
              width: _size.width,
              height: _size.height * 0.65,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: Header(
                          size: _size, restaurantElement: restaurantElement)),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ReadMoreText(restaurantElement.description,
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        textAlign: TextAlign.justify,
                        style: darkTheme.bodyText2,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Show less',
                        colorClickableText: Colors.yellow[900]),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: secondaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          restaurantElement.city,
                          style: darkTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'Food Avaible',
                      style: darkTheme.headline6,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                          height: 170,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildListFood(index);
                              },
                              separatorBuilder: (context, _) => const SizedBox(
                                    width: 25,
                                  ),
                              itemCount: restaurantElement.menu.foods.length))),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'Drink Avaible',
                      style: darkTheme.headline6,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                          height: 148,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildListDrink(index);
                              },
                              separatorBuilder: (context, _) => const SizedBox(
                                    width: 25,
                                  ),
                              itemCount:
                                  restaurantElement.menu.drinks.length))),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const CustomDialog(
                                header: 'Done',
                                detail: 'We will be waiting for you',
                                lottie: 'assets/json/done.json'));
                      },
                      child: Text(
                        'Book Now Only Rp. 25 K',
                        style: lightTheme.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Container buildListFood(int index) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: Image.asset(restaurantElement.menu.foods[index].img,
                fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              restaurantElement.menu.foods[index].name,
              style: darkTheme.subtitle1,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Rp. ${restaurantElement.menu.foods[index].price} K',
              style: darkTheme.bodyText2!.copyWith(color: Colors.yellow[900]),
            ),
          ),
        ],
      ),
    );
  }

  Container buildListDrink(int index) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: Image.asset(restaurantElement.menu.drinks[index].img,
                fit: BoxFit.fitWidth),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              restaurantElement.menu.drinks[index].name,
              style: darkTheme.subtitle1,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Rp. ${restaurantElement.menu.drinks[index].price} K',
              style: darkTheme.bodyText2!.copyWith(color: Colors.yellow[900]),
            ),
          ),
        ],
      ),
    );
  }
}
