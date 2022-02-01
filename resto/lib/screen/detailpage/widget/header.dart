import 'package:flutter/material.dart';
import 'package:resto/model/m_restaurant.dart';
import 'package:resto/screen/loginregister/widget/custom_dialog.dart';
import 'package:resto/style/style.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required Size size,
    required this.restaurantElement,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final RestaurantElement restaurantElement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: _size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantElement.name,
                overflow: TextOverflow.clip,
                style: darkTheme.headline4!.copyWith(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.star_rate_rounded, color: Colors.yellow[900]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    restaurantElement.rating.toString(),
                    style: darkTheme.headline4!
                        .copyWith(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '( 12K Review )',
                    style: darkTheme.headline4!
                        .copyWith(color: Colors.grey, fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const CustomDialog(
                    header: 'Cooming Soon',
                    detail: 'Stay tune guys',
                    lottie: 'assets/json/coming_soon.json'));
          },
          child: ClipOval(
            child: Container(
              color: secondaryColor,
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: primaryColor,
                  child: Icon(
                    Icons.map_sharp,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const CustomDialog(
                    header: 'Cooming Soon',
                    detail: 'Stay tune guys',
                    lottie: 'assets/json/coming_soon.json'));
          },
          child: ClipOval(
            child: Container(
              color: secondaryColor,
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: secondaryColor,
                child: const Icon(
                  Icons.directions,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
