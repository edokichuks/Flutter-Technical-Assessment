import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kooha_task/src/core/app_export.dart';


toastMessage(String text, {bool long = false, Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: color ??  theme.colorScheme.primary,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      textColor: Colors.white);
}

errorToastMessage(String text, {bool long = false, Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: color ?? Colors.red,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      textColor: Colors.white);
}
