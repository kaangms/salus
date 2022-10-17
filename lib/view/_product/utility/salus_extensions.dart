// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/string_constant.dart';

extension SalusAppStringExtension on String? {
  String get avatarFirstChar {
    if (this != null) {
      return this![0];
    } else {
      return '';
    }
  }

  String get rawMessageValue {
    var emptyMessage = MessageConstants.EMPTY_MESSAGE;
    return this == null ? emptyMessage : (this! == '' ? emptyMessage : this!);
  }
}

extension SalusAppBoolExtension on bool? {
  String get getTextForOnlineStatus => (this ?? false) ? 'Çevrimiçi' : 'Çevrimdışı';
  Color get getColorForOnlineStatus => (this ?? false) ? const Color(0xff0BCE63) : const Color(0xff9DA1A0);
}

extension SalusAppIntExtension on int? {
  String get chatBadgeText {
    switch (this) {
      case 1:
        return 'Yeni Eşleşme';
      case 2:
        return 'Randevu Bekleniyor';
      case 3:
        return 'Randevu Ayarlandı';
      case 4:
        return 'Yolculuk Atandı';
      case 5:
        return 'Terapist Atandı';
      default:
        return '';
    }
  }

  Color? get chatBadgeColor {
    switch (this) {
      case 1:
        return const Color(0xffD8FDDB);
      //'Yeni Eşleşme';
      case 2:
        return const Color(0xffFEF5CC);
      //'Randevu Bekleniyor';
      case 3:
      //'Randevu Ayarlandı';
      case 4:
      // 'Yolculuk Atandı';
      case 5:
        return const Color(0xffEDEEED);
      //'Terapist Atandı';
      default:
        return null;
    }
  }

  Color? get chatBadgeTextColor {
    switch (this) {
      case 1:
        return const Color(0xff029E48);
      //'Yeni Eşleşme';
      case 2:
        return const Color(0xffAC7201);
      //'Randevu Bekleniyor';
      case 3:
      //'Randevu Ayarlandı';
      case 4:
      // 'Yolculuk Atandı';
      case 5:
        return const Color(0xff9DA1A0);
      //'Terapist Atandı';
      default:
        return null;
    }
  }

  String get getRefIdText {
    return '# ${this}';
  }

  Color get rawMessageTextColor {
    var unreadMessage = this ?? 0;
    return unreadMessage == 0 ? const Color(0xff9DA1A0) : const Color(0xff1A2321);
  }

  bool get isHasMessageHour {
    var unreadMessage = this ?? 0;
    return unreadMessage != 0;
  }
}

extension SalusDateTimeExtension on DateTime? {
  String get getTime => this == null ? '' : DateFormat('HH:mm').format(this!).toString();
  DateTime get dateParse => DateFormat("yyyy-MM-dd HH:mm").parse(this.toString());
  String get getDate {
    return this == null
        ? ''
        : DateFormat('yyyy-MM-dd').format(this!).toString() == getTodayDate
            ? 'Bugün'
            : DateFormat('yyyy-MM-dd').format(this!).toString() == getLastDate
                ? 'Dün'
                : DateFormat('yyyy-MM-dd').format(this!).toString();
  }

  String get getTodayDate => DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String get getLastDate => DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)).toString();
}
