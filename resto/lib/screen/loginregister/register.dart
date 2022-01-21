import 'package:flutter/material.dart';
import 'package:resto/screen/loginregister/widget/blur.dart';
import 'package:resto/services/auth.dart';
import 'package:resto/style/style.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {

  static const routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthServices _authServices = AuthServices();
  final _checkemail = GlobalKey<FormState>();
  final _checkpass = GlobalKey<FormState>();
  final _checkname = GlobalKey<FormState>();

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
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: _size.height,
              width: _size.width,
              child: const Image(
                image: AssetImage('assets/images/chef.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: buildBlur(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: _size.height * 0.85,
                    width: _size.width,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.8)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welecome',
                            style: lightTheme.headline4,
                          ),
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          Text(
                            'Looks like you don\'t have any account\nLet\'s create a new one for you!',
                            textAlign: TextAlign.left,
                            style: lightTheme.bodyText1,
                          ),
                          SizedBox(
                            height: _size.height * 0.04,
                          ),
                          Form(
                            key: _checkname,
                            child: TextFormField(
                              style: lightTheme.subtitle1,
                              decoration: InputDecoration(
                                labelText: 'Name',
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
                                  name = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your mame';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
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
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Or',
                            style: lightTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          SizedBox(
                            width: _size.width * 0.7,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    onPrimary: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      child: Image(
                                          height: _size.height * 0.04,
                                          image: const AssetImage(
                                              'assets/images/google.png')),
                                    ),
                                    const Text(
                                      'Continue with google',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          SizedBox(
                            width: _size.width * 0.7,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    onPrimary: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      child: Image(
                                          height: _size.height * 0.04,
                                          image: const AssetImage(
                                              'assets/images/facebook.png')),
                                    ),
                                    const Text(
                                      'Continue with facebook',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          SizedBox(
                            width: _size.width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () async {
                                  if (
                                    _checkname.currentState!.validate()&&
                                    _checkemail.currentState!.validate()&&
                                    _checkpass.currentState!.validate()
                                    ) {
                                    dynamic result = await _authServices.register(email, password);
                                    print(result.toString());
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
                                'Already have an account?',
                                style: lightTheme.bodyText2,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    'Sign In',
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
