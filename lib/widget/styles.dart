import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color firstColor = Color(0xff2c3333);
const Color secondColor = Color(0xff395b64);
const Color thirdColor = Color(0xffa5c9ca);
const Color fourthColor = Color(0xffe7f6f2);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.roboto(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.roboto(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.roboto(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.robotoSerif(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.robotoSerif(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.robotoSerif(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.robotoSerif(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.robotoSerif(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
