import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kSmallButtonTextStyle =
    GoogleFonts.rubik(fontSize: 16, color: kTextColor);
final kNormalTextStyle = GoogleFonts.rubik(fontSize: 25, color: kTextColor);
final kSmallTextStyleLabel =
    GoogleFonts.rubik(fontSize: 14.5, color: kTextColor);
final kButtonTextStyle = GoogleFonts.rubik(fontSize: 17, color: kTextColor);

final kHeaderTextStyle = GoogleFonts.rubik(fontSize: 25, color: kAccentColor);

const kBoxDecoration = BoxDecoration(
  color: Colors.black38,
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
);

const kInactiveColor = Colors.black38;
const kButtonTextColor = Colors.white;
const kButtonIconColor = Colors.white;

const kBackgroundColor = Color.fromARGB(255, 38, 35, 35);

const kButtonColor = Color.fromARGB(255, 0, 58, 230);
const kTextColor = Colors.white;
const kIconColor = Colors.white;
const kAccentColor = Colors.orange;

const String DBFileName = 'samochodyDB';

//Color(0xFF420000)- bordowy
//Color(0xff520000)- bordowy
//Color.fromARGB(255, 217, 115, 13);- pomarańczowy
//Color.fromARGB(255, 230, 61, 0);
//const kTextColor = Color.fromARGB(255, 0, 58, 230);
