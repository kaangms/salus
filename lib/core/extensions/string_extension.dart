// ignore_for_file: unnecessary_this
import 'package:flutter/cupertino.dart';

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}

extension StringColorExtension on String {
  Color get color => Color(int.parse('0xff$this'));
}

extension StringValidatorExtension on String {
  bool get isNullOrEmpty => isEmpty;
  bool get isNotNullOrNoEmpty => isNotEmpty;
}

extension AuthorizationExtension on String {
  Map<String, dynamic> get bearer => {'Authorization': 'Bearer ${this}'};
  String get beraerString => {'Authorization': 'Bearer ${this}'}.toString();
}

extension StringExtension on String {
  String get toCamelCase {
    var result = '';
    var value = this;
    var valueList = value.split('');
    for (var item in valueList) {
      result += '${item[0].toUpperCase()}${item.substring(1).toLowerCase()}';
    }
    return result;
  }
}

extension NetworkImageExtension on String {
  String get randomImage => 'https://picsum.photos/200/300';
  String get randomSquareImage => 'https://picsum.photos/200';

  String get customProfileImage => 'https://www.gravatar.com/avatar/?d=mp';
  String get customHighProfileImage => 'https://www.gravatar.com/avatar/?d=mp&s=200';
}
