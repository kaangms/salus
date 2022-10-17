// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showPlatformAlertDialog(
  BuildContext context, {
  String? title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
  required VoidCallback onPressed,
  VoidCallback? onPressedCancel,
}) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: title == null ? null : Text(title),
              content: title == null ? Text(content) : Text(content),
              contentPadding: content == null ? EdgeInsets.zero : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
              actions: [
                if (cancelActionText != null)
                  TextButton(
                    onPressed: onPressedCancel,
                    child: Text(
                      cancelActionText,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ),
                TextButton(
                  onPressed: onPressed,
                  child: Text(defaultActionText),
                )
              ],
            ));
  }
  return showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: title == null ? null : Text(title),
            content: title == null
                ? Text(
                    content,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                : Text(content),
            actions: [
              if (cancelActionText != null)
                TextButton(
                  onPressed: onPressedCancel,
                  child: Text(
                    cancelActionText,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
              CupertinoDialogAction(
                onPressed: onPressed,
                child: Text(defaultActionText),
              )
            ],
          ));
}
