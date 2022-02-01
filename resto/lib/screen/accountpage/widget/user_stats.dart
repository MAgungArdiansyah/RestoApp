import 'package:flutter/material.dart';
import 'package:resto/style/style.dart';

class UserStats extends StatelessWidget {
  const UserStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Stats(value: '23', stats: 'Order'),
          SizedBox(
              height: 30,
              child: VerticalDivider(
                color: secondaryColor,
                thickness: 2,
              )),
          const Stats(value: '3', stats: 'Favorites'),
          SizedBox(
              height: 30,
              child: VerticalDivider(
                color: secondaryColor,
                thickness: 2,
              )),
          const Stats(value: '415', stats: 'Point'),
        ],
      ),
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String stats;

  const Stats({Key? key, required this.value, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      child: Column(
        children: [
          Text(
            value,
            style: darkTheme.headline4,
          ),
          Text(
            stats,
            style: darkTheme.subtitle1,
          )
        ],
      ),
    );
  }
}