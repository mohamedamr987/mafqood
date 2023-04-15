import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';

BottomNavigationBarItem bottomNavigationBarItemWidget({
  required String label,
  required IconData icon,
}) {
  return BottomNavigationBarItem(
    backgroundColor: kPrimaryColor,
    label: label,
    icon: Icon(
      icon,
    ),
  );
}