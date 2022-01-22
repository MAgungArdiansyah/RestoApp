import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Colors.white;
final Color secondaryColor = Colors.green.shade500;
const Color errorColor = Colors.red;

final TextTheme lightTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 93,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5),
  headline2: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 58,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5),
  headline3: GoogleFonts.poppins(
      color: Colors.white, fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 38,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25),
  headline5: GoogleFonts.poppins(
      color: Colors.white, fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.poppins(
      color: Colors.red,
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1),
  bodyText1: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5),
  bodyText2: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  button: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  caption: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4),
  overline: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5),
);

final TextTheme darkTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 93,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5),
  headline2: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 58,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5),
  headline3: GoogleFonts.poppins(
      color: Colors.black, fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 38,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25),
  headline5: GoogleFonts.poppins(
      color: Colors.black, fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(
      color: Colors.red,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1),
  bodyText1: GoogleFonts.josefinSans(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5),
  bodyText2: GoogleFonts.josefinSans(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  button: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  caption: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4),
  overline: GoogleFonts.josefinSans(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5),
);
