import 'package:flutter/material.dart';
import 'package:resto/screen/loginregister/register.dart';
import 'package:resto/style/style.dart';

class LandingPage3 extends StatelessWidget {
  static const routeName = '/landingPage3';

  const LandingPage3({Key? key}) : super(key: key);

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
              image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/resto-a13dc.appspot.com/o/images%2Fjus.jpg?alt=media&token=b5caf178-d5f6-49fc-9ef8-cde968302983'),
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
                  'A Juice a day',
                  style: lightTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  'A fruit gives healthy mind but a fruit juice \n gives you a healthy body too',
                  style: lightTheme.bodyText2,
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
                                context, RegisterPage.routeName);
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
