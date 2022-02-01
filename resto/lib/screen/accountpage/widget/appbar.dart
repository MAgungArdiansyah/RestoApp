import 'package:flutter/material.dart';
import 'package:resto/style/style.dart';

AppBar buildAppbar(BuildContext context){

  return AppBar(
    leading: IconButton(
      color: secondaryColor,
      onPressed: () {
        Navigator.pop(context);
      },
      icon:const Icon(Icons.arrow_back),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      'Profile',
      style: darkTheme.headline6,
    ),
    centerTitle: true,
  );

}