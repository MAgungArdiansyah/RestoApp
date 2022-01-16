import 'package:flutter/material.dart';
import 'package:resto/screen/loginregister/register.dart';

import 'package:resto/style/style.dart';

import 'Landing2.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({Key? key}) : super(key: key);

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
              image: AssetImage('assets/images/bakso.jpg'),
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
                  'Find Your Best \n Meal & Deal Here',
                  style: lightTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  'Many restaurant you can choise \n from tradisional to international food',
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        }, 
                        child: Text('Skip')
                      ),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage2()));
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
