import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resto/screen/homepage/homepage.dart';
import 'package:resto/services/auth.dart';
import 'package:resto/style/style.dart';

import 'register.dart';
import 'widget/blur.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _authServices = AuthServices();
  final _checkemail = GlobalKey<FormState>();
  final _checkpass = GlobalKey<FormState>();

  bool _isPassVisible = true;
  String email = '';
  String password = '';
  String name = '';

 
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                height: _size.height,
                width: _size.width,
                child: const Image(
                  image: AssetImage('assets/images/waiter.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildBlur(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: _size.height * 0.57,
                    width: _size.width,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hello There!',
                            style: lightTheme.headline4,
                          ),
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          Text(
                            'Welecome back \n you\'ve been missed!',
                            textAlign: TextAlign.center,
                            style: lightTheme.bodyText1,
                          ),
                          SizedBox(
                            height: _size.height * 0.04,
                          ),
                          Form(
                            key: _checkemail,
                            child: TextFormField(
                              style: lightTheme.subtitle1,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: lightTheme.subtitle1,
                                errorStyle: lightTheme.subtitle2,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: primaryColor, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: errorColor, width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: errorColor, width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your e-mail';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          Form(
                            key: _checkpass,
                            child: TextFormField(
                              obscureText: _isPassVisible,
                              style: lightTheme.subtitle1,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: lightTheme.subtitle1,
                                errorStyle: lightTheme.subtitle2,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPassVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: secondaryColor,
                                  ),
                                  onPressed: () => setState(() {
                                    _isPassVisible = !_isPassVisible;
                                  }),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: primaryColor, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: errorColor, width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: errorColor, width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                } else {
                                  return null;
                                }
                              },
                              textInputAction: TextInputAction.done,
                            ),
                          ),                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot your password?',
                                  )
                              ),
                            ],
                          ),
                         
                          SizedBox(
                            width: _size.width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                onPressed: () async {
                                  if (
                                    _checkemail.currentState!.validate()&&
                                    _checkpass.currentState!.validate()
                                    ) {
                                    dynamic result = await _authServices.signEmailPassword(email, password);
                                    print(result.toString());
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  }
                                  
                                },
                                child: Text(
                                  'Sign In',
                                  style: lightTheme.button,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: lightTheme.bodyText2,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                                  },
                                  child: Text(
                                    'Sign Up',
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
