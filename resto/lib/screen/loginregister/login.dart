import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('Get Started', style: Theme.of(context).textTheme.headline1,),
          Text('Temukan makanan kesuakaan anda dari berbagai macam restoran ternama dalam satu aplikasi'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: Text('Skip Now', )),
              ElevatedButton(onPressed: () {}, child: Text('Next'))
            ],
          )
        ],
      ),
    );
  }
}