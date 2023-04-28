import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextAlignHelper{
  TextAlign textAlign = TextAlign.start;

  void changeAlignment(String text){
    if(isRtl(text)){
      textAlign = TextAlign.right;
    }
    else{
      textAlign = TextAlign.left;
    }
  }

  static bool isRtl(String text){
    return Bidi.detectRtlDirectionality(text);
  }
}