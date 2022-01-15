import 'package:flutter/material.dart';
import 'package:resto/screen/loginregister/widget/blur.dart';
import 'package:resto/style/style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isPassVisible = true;

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
                        BoxDecoration(color: Colors.black.withOpacity(0.7)),
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
                            'Looks like you don\'t have an account\nLet\'s create a new one for you!',
                            textAlign: TextAlign.left,
                            style: lightTheme.bodyText1,
                          ),
                          SizedBox(
                            height: _size.height * 0.04,
                          ),
                          TextField(
                            style: lightTheme.subtitle1,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: lightTheme.subtitle1,
                              suffixIcon: _emailController.text.isEmpty
                                  ? Container(width: 0)
                                  : IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: secondaryColor,
                                      ),
                                      onPressed: () => _emailController.clear(),
                                    ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: secondaryColor, width: 2.0),
                              ),
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          TextField(
                            style: lightTheme.subtitle1,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: lightTheme.subtitle1,
                              suffixIcon: _emailController.text.isEmpty
                                  ? Container(width: 0)
                                  : IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: secondaryColor,
                                      ),
                                      onPressed: () => _emailController.clear(),
                                    ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: secondaryColor, width: 2.0),
                              ),
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          TextField(
                            style: lightTheme.subtitle1,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: lightTheme.subtitle1,
                              suffixIcon: _emailController.text.isEmpty
                                  ? Container(width: 0)
                                  : IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: secondaryColor,
                                      ),
                                      onPressed: () => _emailController.clear(),
                                    ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: secondaryColor, width: 2.0),
                              ),
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: () {}, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Image(
                                      height: _size.height * 0.04,
                                      image: AssetImage('assets/images/google.png')
                                    ),
                                  ),
                                  Text(
                                    'Continue with google',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          SizedBox(
                            width: _size.width * 0.7,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: () {}, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Image(
                                      height: _size.height * 0.04,
                                      image: AssetImage('assets/images/facebook.png')
                                    ),
                                  ),
                                  Text(
                                    'Continue with facebook',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          SizedBox(
                            width: _size.width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                onPressed: () {
                                  print(_passController.text);
                                  print(_emailController.text);
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
                                  onPressed: () {},
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
