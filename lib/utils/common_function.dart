import 'dart:convert';
import 'dart:io';
import 'dart:math';

// import 'package:envisoft_e4f_appmobile/base/utils/extension/string.dart';
import 'package:figure_toys/utils/widget/transition/fade_route.dart';
import 'package:figure_toys/utils/widget/transition/rotation_route.dart';
import 'package:figure_toys/utils/widget/transition/scale_rotate_route.dart';
import 'package:figure_toys/utils/widget/transition/scale_route.dart';
import 'package:figure_toys/utils/widget/transition/size_route.dart';
import 'package:figure_toys/utils/widget/transition/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:local_auth/local_auth.dart';

import '../../main.dart';

// import 'app_constant.dart';
import 'enum_base.dart';

// Color getColor(String hex, {int? alpha}) {
//   return hex.toColor();
// }

bool isNullOrEmpty(dynamic object) {
  if (object == null) return true;
  if (object == "null") return true;
  if (object is String) {
    return object.isEmpty;
  }
  if (object is List) {
    return object.length == 0;
  }
  if (object is Map) {
    return object.length == 0;
  }
  if (object is Set) {
    return object.length == 0;
  }
  return false;
}

bool isNullOrZero(dynamic object) {
  if (object == null) return true;
  if (object is int || object is double) {
    if (object == 0) return true;
  }
  return isNullOrEmpty(object);
}

bool isNotNullOrEmpty(dynamic object) {
  return !isNullOrEmpty(object);
}

Future pushPage(BuildContext context, Widget page,
    {String? name,
    TransitionEnum? transitionAnimation = TransitionEnum.rightToLeft}) {
  return Navigator.of(context).push(
    _pageBuilder(page, transitionAnimation: transitionAnimation),
  );
}

Future pushAndRemoveUntil(BuildContext context, Widget page,
    {String? name,
    TransitionEnum? transitionAnimation = TransitionEnum.rightToLeft}) {
  return Navigator.of(context).pushAndRemoveUntil(
    _pageBuilder(page, transitionAnimation: transitionAnimation),
    ModalRoute.withName(name ?? ""),
  );
}

Route _pageBuilder(
  Widget page, {
  TransitionEnum? transitionAnimation,
}) {
  switch (transitionAnimation) {
    case TransitionEnum.leftToRight:
      // từ trái qua phải
      return SlideRightRoute(page: page);
    case TransitionEnum.rightToLeft:
      // từ phải qua trái
      return SlideLeftRoute(page: page);
    case TransitionEnum.upToDown:
      // từ trên xuống dưới
      return SlideBottomRoute(page: page);
    case TransitionEnum.downToUp:
      // từ dưới lên trên
      return SlideTopRoute(page: page);
    case TransitionEnum.centerTwoTurn:
      // hiển thị ở giữa rồi xoay 2 vòng
      return RotationRoute(page: page);
    case TransitionEnum.centerTurnToBig:
      // hiển thị ở giữa rồi xoay 1 vòng và to ra
      return ScaleRotateRoute(page: page);
    case TransitionEnum.centerForSide:
      // hiển thị ở giữa rồi lan ra 4 góc
      return ScaleRoute(page: page);
    case TransitionEnum.centerToUpDown:
      // hiển thị ở giữa rồi lan ra 2 cạnh trên và dưới
      return SizeRoute(page: page);
    case TransitionEnum.lightUp:
      // từ mờ và sáng lên
      return FadeRoute(page: page);
    case TransitionEnum.defaultPage:
    default:
      return MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(name: page.runtimeType.toString()),
      );
  }


  /// hiển thị ra 2 page
  /// Khi vừa vào exitPage hiển thị trước, enterPage hiển thị sau
  /// khi back về thì ngược lại
  // return Navigator.of(context)
  //     .push(EnterExitRoute(enterPage: page, exitPage: page));
}

const String textNotLeftBlank = ' không được bỏ trống!';
//
// String getEspecially(String date, {String? format}) {
//   return DateFormat(format).format(getDateTimeObject(date));
// }
//
// String getDateTimeDefault(String date, {String? format}) {
//   return date.toDateTimeFormat(format ?? Constant.ddMMyyyyHHmmss2);
// }
//
// String getFullDateTime(String date) {
//   return date.toDateTimeFormat(Constant.ddMMyyyyHHmmss2);
// }
//
// String getDateTime(String date) {
//   return date.toDateTimeFormat(Constant.ddMMyyyyHHmm2);
// }
//
// String getTime(String date) {
//   return date.toDateTimeFormat(Constant.HHmm);
// }
//
// String getDate(String date) {
//   return date.toDateTimeFormat(Constant.ddMMyyyy2);
// }
//
// DateTime getDateTimeObject(String date, {String? format}) {
//   if (isNullOrEmpty(date)) {
//     return DateTime(0);
//   }
//   if (isNullOrEmpty(format)) {
//     String format = Constant.ddMMyyyyHHmm2;
//     int count = date.length - date.replaceAll(":", "").length;
//     if (date.contains("T")) {
//       return DateTime.parse(date);
//     } else if (count == 0) {
//       format = Constant.ddMMyyyy2;
//     } else if (count == 2) {
//       format = Constant.ddMMyyyyHHmmss2;
//     }
//     return DateFormat(format).parse(date);
//   }
//   return DateFormat(format).parse(date);
// }
//
// // lấy thời gian hiện tại
// String getCurrentDate(String format) {
//   return DateFormat(format).format(DateTime.now());
// }
//
// // đổi String về dateTime
// DateTime? stringToDateTime(String time,
//     {String format = Constant.ddMMyyyyHHmmss2}) {
//   if (isNullOrEmpty(time)) return null;
//   return DateFormat(format).parse(time);
// }
//
// // đổi dateTime về String
// String dateTimeToString(DateTime time,
//     {String format = Constant.ddMMyyyyHHmmss2}) {
//   if (isNullOrEmpty(time)) return "";
//   String date = DateFormat(format).format(time);
//   return date;
// }
//
// String convertImageBase64(String image64) {
//   final bytes = File(image64).readAsBytesSync();
//   String img64 = base64Encode(bytes);
//   return img64;
// }
//
// // String compareDateNow(String timeSever) {
// //   if (isNullOrEmpty(timeSever)) return "";
// //   String timeNow = dateTimeToString(DateTime.now(), format: Constant.ddMMyyyy2);
// //   // String time = getDate(timeSever, formatString: Constant.ddMMyyyy2);
// //
// //   String time = getDateFormat(Constant.ddMMyyyy2,
// //       getDateTimeObject(timeSever, format: Constant.ddMMyyyy2));
// //   if (timeNow == time) {
// //     return getDate(timeSever, formatString: Constant.HHmmss);
// //   }
// //   return timeSever;
// // }
//
// /// dành riêng cho check version app, xem kỹ trước khi sửa
// /// version1 = store or google play
// /// version2 = api return
// int compareVersion(String version1, String version2) {
//   if (version1 == version2) return 0;
//   version2 = version2.replaceAll(" ", "");
//   version2 = version2.replaceAll("(", ".");
//   version2 = version2.replaceAll(")", "");
//   List<int> list1 = version1.split(".").map((e) => int.parse(e)).toList();
//   List<int> list2 = version2.split(".").map((e) => int.parse(e)).toList();
//   int minLength = min(list1.length, list2.length);
//   for (int i = 0; i < minLength; i++) {
//     if (list1[i].compareTo(list2[i]) == 0) {
//       continue;
//     } else {
//       return list1[i].compareTo(list2[i]);
//     }
//   }
//   return list1.length.compareTo(list2.length);
// }
//
// String stringMap(dynamic param) {
//   if (isNullOrEmpty(param) || param is List) return "";
//
//   if (param is int || param is String || param is double || param is bool) {
//     return "/$param";
//   }
//
//   // param = map thì đi tiếp
//   String valueGet = "";
//   param.forEach((key, value) {
//     if (isNullOrEmpty(key)) {
//       valueGet = value.toString();
//     } else {
//       if (isNullOrEmpty(valueGet)) {
//         valueGet = "$key=${value.toString()}";
//       } else {
//         valueGet = valueGet + "&$key=${value.toString()}";
//       }
//     }
//   });
//
//   if (isNullOrEmpty(valueGet)) return "";
//
//   if (param.length == 1) {
//     valueGet = "/" + valueGet;
//   } else {
//     valueGet = "?" + valueGet;
//   }
//
//   return valueGet;
// }
//
// bool sizeMobile() {
//   if (MediaQuery.of(mainGlobalKey.currentContext!).size.width < 1100 &&
//       MediaQuery.of(mainGlobalKey.currentContext!).size.width >= 650) {
//     return false;
//   }
//   return true;
// }
//
// // dùng cho textFormField
// bool validateAndSave(GlobalKey<FormState> key) {
//   FormState? form = key.currentState;
//   if (form?.validate() ?? false) {
//     form?.save();
//     return true;
//   }
//   return false;
// }
//
// // ẩn bàn phím
// void hideKeyboard() {
//   SystemChannels.textInput.invokeMethod('TextInput.hide');
// }
//
// // ẩn bàn phím và tắt focus trên textField
// void hideKeyboardAndUnFocus(BuildContext context) {
//   FocusScope.of(context).unfocus();
//   SystemChannels.textInput.invokeMethod('TextInput.hide');
// }
//
// String formatMoney(dynamic number) {
//   return NumberFormat('#,###').format(number);
// }
//
// Future<bool> hasFaceId() async {
//   final _localAuth = LocalAuthentication();
//   try {
//     List<BiometricType> availableBiometrics =
//         await _localAuth.getAvailableBiometrics();
//     return availableBiometrics.contains(BiometricType.face);
//   } on PlatformException catch (e) {
//     print(e.message);
//     return false;
//   }
// }
//
// Future<bool> isHasLessOneBiometric() async {
//   final _localAuth = LocalAuthentication();
//   try {
//     return await _localAuth.canCheckBiometrics;
//   } on PlatformException catch (e) {
//     print(e.message);
//   }
//   return false;
// }
//
// Future<bool> hasTouchId() async {
//   final _localAuth = LocalAuthentication();
//   try {
//     List<BiometricType> availableBiometrics =
//         await _localAuth.getAvailableBiometrics();
//     return availableBiometrics.contains(BiometricType.fingerprint);
//   } on PlatformException catch (e) {
//     print(e.message);
//     return false;
//   }
// }
