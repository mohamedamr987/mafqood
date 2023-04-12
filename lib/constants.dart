import 'package:flutter/material.dart';


const Color kPrimaryColor = Color(0xFF40B3E4);
const Color kSecondaryColor = Color(0xFF2A4CA1);

const Color kFontColor = Color(0xFF121212);

String kErrorText = "Something went wrong, please try again later";

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    // spreadRadius: 5,
    blurRadius: 2,
    offset: const Offset(0, 5), // changes position of shadow
  ),
];

BorderRadius kRadiusBorder =  const BorderRadius.all(Radius.circular(4.0),);

UnderlineInputBorder kAppBarBorder = UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.4),),);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.3),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
OutlineInputBorder getBorderStyle(Color color, double borderWidth )
{
  return OutlineInputBorder(
    borderRadius:  const BorderRadius.all(Radius.circular(22.0),),
    borderSide: BorderSide(color: color,width:borderWidth ),
  );
}
