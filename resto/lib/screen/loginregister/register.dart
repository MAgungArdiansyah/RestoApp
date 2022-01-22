import 'package:flutter/material.dart';
import 'package:resto/screen/homepage/homepage.dart';
import 'package:resto/screen/loginregister/widget/blur.dart';
import 'package:resto/screen/loginregister/widget/customDialog.dart';
import 'package:resto/screen/loginregister/widget/loading.dart';
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
  bool loading = false;
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: AuthServices().user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return loading
                ? const Loading()
                : SafeArea(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  height: _size.height * 0.90,
                                  width: _size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Welecome',
                                          style: lightTheme.headline4,
                                        ),
                                        SizedBox(
                                          height: _size.height * 0.01,
                                        ),
                                        Text(
                                          'You don\'t have an account?\nLet\'s create a new one for you!',
                                          textAlign: TextAlign.left,
                                          style: lightTheme.bodyText1,
                                        ),
                                        SizedBox(
                                          height: _size.height * 0.04,
                                        ),
                                        nameForm(),
                                        SizedBox(
                                          height: _size.height * 0.03,
                                        ),
                                        emailForm(),
                                        SizedBox(
                                          height: _size.height * 0.03,
                                        ),
                                        passwordForm(),
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
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        CustomDialog(
                                                            header:
                                                                'Coming Soon!',
                                                            detail:
                                                                'Stay tune guys',
                                                            lottie:
                                                                'assets/json/coming_soon.json'));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    child: Image(
                                                        height:
                                                            _size.height * 0.04,
                                                        image: const AssetImage(
                                                            'assets/images/google.png')),
                                                  ),
                                                  const Text(
                                                    'Continue with google',
                                                    style: TextStyle(
                                                        color: Colors.black),
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
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        CustomDialog(
                                                            header:
                                                                'Coming Soon!',
                                                            detail:
                                                                'Stay tune guys',
                                                            lottie:
                                                                'assets/json/coming_soon.json'));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    child: Image(
                                                        height:
                                                            _size.height * 0.04,
                                                        image: const AssetImage(
                                                            'assets/images/facebook.png')),
                                                  ),
                                                  const Text(
                                                    'Continue with facebook',
                                                    style: TextStyle(
                                                        color: Colors.black),
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
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () async {
                                                if (_checkname.currentState!
                                                        .validate() &&
                                                    _checkemail.currentState!
                                                        .validate() &&
                                                    _checkpass.currentState!
                                                        .validate()) {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  dynamic result =
                                                      await _authServices
                                                          .register(
                                                              email, password);
                                                  print(result);
                                                  if (result ==
                                                      '[firebase_auth/invalid-email] The email address is badly formatted.') {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    return showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            CustomDialog(
                                                              header:
                                                                  'Fail to Sign Up',
                                                              detail:
                                                                  'Please check your e-mail',
                                                              lottie:
                                                                  'assets/json/fail2.json',
                                                            ));
                                                  } else if (result ==
                                                      '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    return showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            CustomDialog(
                                                              header:
                                                                  'Fail to Sign Up',
                                                              detail:
                                                                  'Please check your internet connection',
                                                              lottie:
                                                                  'assets/json/fail2.json',
                                                            ));
                                                  } else if (result ==
                                                      '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    return showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            CustomDialog(
                                                              header:
                                                                  'Fail to Sign Up',
                                                              detail:
                                                                  'The email address is already in used',
                                                              lottie:
                                                                  'assets/json/fail2.json',
                                                            ));
                                                  }
                                                }
                                              },
                                              child: Text(
                                                'Sign Up',
                                                style: lightTheme.button,
                                              )),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already have an account?',
                                              style: lightTheme.subtitle1,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      LoginPage.routeName);
                                                },
                                                child: const Text(
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
            ;
          }
        });
  }

  Form passwordForm() {
    return Form(
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
              _isPassVisible ? Icons.visibility_off : Icons.visibility,
              color: secondaryColor,
            ),
            onPressed: () => setState(() {
              _isPassVisible = !_isPassVisible;
            }),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: secondaryColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
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
          } else if (value.length < 6) {
            return 'Password must have at least 6 characters';
          } else {
            return null;
          }
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Form emailForm() {
    return Form(
      key: _checkemail,
      child: TextFormField(
        style: lightTheme.subtitle1,
        decoration: InputDecoration(
          labelText: 'E-mail',
          labelStyle: lightTheme.subtitle1,
          errorStyle: lightTheme.subtitle2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: secondaryColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
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
    );
  }

  Form nameForm() {
    return Form(
      key: _checkname,
      child: TextFormField(
        style: lightTheme.subtitle1,
        decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: lightTheme.subtitle1,
          errorStyle: lightTheme.subtitle2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: secondaryColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: errorColor, width: 2.0),
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
    );
  }
}
