import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resto/screen/loginregister/login.dart';
import 'package:resto/services/auth.dart';
import 'package:resto/style/style.dart';

import 'screen/landingpage/landing1.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: secondaryColor,
          )
        ),

      ),
      home: const LandingPage1(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthServices _authServices = AuthServices();

  String text = '';

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _authServices.signAninon();
                if (result != null) {
                  setState(() {
                    text = 'Succes';
                    Navigator.push(context, MaterialPageRoute(builder: (contex) => SecondPage()));
                  });
                } else {
                  setState(() {
                    text = 'Fail';
                  });
                }
              }, 
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            SizedBox(
              height: 0.01 * _size.height,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
   SecondPage({ Key? key }) : super(key: key);

  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _authServices.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
           
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
