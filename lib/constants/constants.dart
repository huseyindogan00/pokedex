import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = 'Pokedex';
  static String pokebollImagePath = 'assets/images/pokeball.png';

  static TextStyle get titleStyle {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(24));
  }

  static TextStyle get getPokemonTextStyle {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(18));
  }

  static TextStyle get getTypeChipTextStyle {
    return TextStyle(color: Colors.white, fontSize: _calculateFontSize(18));
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.9).sp;
    }
  }

  static calculateIconSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.5).sp;
    }
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(14), color: Colors.black);
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(14), fontWeight: FontWeight.bold, color: Colors.black);
  }
}
