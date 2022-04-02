import 'package:flutter/material.dart';
import 'package:resto/screen/loginregister/register.dart';
import 'package:resto/style/style.dart';

import 'landing3.dart';

class LandingPage2 extends StatelessWidget {
  static const routeName = '/landingPage2';

  const LandingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: _size.height,
            width: _size.width,
            child: const Image(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/resto-a13dc.appspot.com/o/images%2Fbarista.jpg?alt=media&token=a2359f43-3992-46f6-9719-329065302bb8'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: _size.height * 0.8,
            width: _size.width,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Better coffee! Less bucks!',
                  style: lightTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  'May your coffee be strong and \n your Monday be short.',
                  style: lightTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterPage.routeName);
                          },
                          child: const Text('Skip')),
                      SizedBox(
                        width: _size.width * 0.3,
                        height: _size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //alignment: ,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LandingPage3.routeName);
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
