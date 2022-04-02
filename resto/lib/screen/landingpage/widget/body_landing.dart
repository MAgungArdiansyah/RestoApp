import 'package:flutter/material.dart';
import 'package:resto/screen/landingpage/landing2.dart';
import 'package:resto/screen/loginregister/register.dart';
import 'package:resto/style/style.dart';

class BodyLand extends StatelessWidget {
  const BodyLand(
      {Key? key,
      required Size size,
      required this.imgUrl,
      required this.title,
      required this.description})
      : _size = size,
        super(key: key);

  final Size _size;
  final String imgUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: _size.height,
            width: _size.width,
            child: Image(
              image: NetworkImage(
                imgUrl,
              ),
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
                  title,
                  style: lightTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  description,
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
                                context, LandingPage2.routeName);
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
