import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._init();
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

//#FDFDFD

  final Color blue = const Color(0xff003087);
  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color like = const Color(0xffc10e0e);

  final Color lightWhite = const Color(0xffFDFDFD);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff39413F); //39413F
  final Color white = const Color(0xffffffff);
  final Color azure = const Color(0xff28938E); //#e66430
  final Color orange = const Color(0xffe66430); //#e66430
  final Color burgundy = const Color(0xff851F36);
}
