import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';

class ErrorMessageSnackBar {
  void message(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colors.error,
          duration: const Duration(milliseconds: 1200),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.sentiment_dissatisfied_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Mesaj Gönderilemedi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // backgroundColor: Colors.black54,
        ),
      );
}
