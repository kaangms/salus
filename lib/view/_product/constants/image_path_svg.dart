import '../../../core/extensions/string_extension.dart';

class SVGImagePath {
  SVGImagePath._init();
  static final SVGImagePath _instance = SVGImagePath._init();
  static SVGImagePath get instance => _instance;

  final homeSVG = 'home'.toSVG;
  final messageSVG = 'message'.toSVG;
  final backSVG = 'back'.toSVG;
}
//sold_out