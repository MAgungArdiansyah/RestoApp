import 'package:flutter/material.dart';
import 'package:resto/screen/homepage/home_page.dart';
import 'package:resto/screen/landingpage/landing2.dart';
import 'package:resto/screen/landingpage/widget/body_landing.dart';
import 'package:resto/screen/loginregister/register.dart';
import 'package:resto/services/auth.dart';
import 'package:resto/style/style.dart';

class LandingPage1 extends StatelessWidget {
  static const routeName = '/landingPage1';

  const LandingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: AuthServices().user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return BodyLand(
              size: _size,
              imgUrl:
                  'https://firebasestorage.googleapis.com/v0/b/resto-a13dc.appspot.com/o/images%2Fbakso.jpg?alt=media&token=74330138-82e3-4bc1-9c73-942a473b127a',
              title: 'Find Your Best\nMeal & Deal Here',
              description: 'Many restaurant you can choise\nfrom tradisional to international food',
            );
          }
        });
  }
}


