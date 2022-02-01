import 'package:flutter/material.dart';
import 'package:resto/screen/homepage/widget/customDialog.dart';
import 'package:resto/style/style.dart';

class Head extends StatelessWidget {
  const Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find good\nFood around you',
          style: darkTheme.headline4!.copyWith(fontSize: 34),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 1.5)),
          child: MaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialogHome(
                      header: 'Cooming Soon',
                      detail: 'Stay tune guys',
                      lottie: 'assets/json/coming_soon.json'));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: secondaryColor, width: 1)),
            splashColor: secondaryColor,
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Search your fav resto',
                  style: darkTheme.subtitle1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
