import 'package:flutter/material.dart';

import '../utility/salus_extensions.dart';

class SalusBadge extends StatelessWidget {
  const SalusBadge({
    Key? key,
    this.status,
  }) : super(key: key);
  final int? status;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: status.chatBadgeColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Text(
            status.chatBadgeText,
            style: TextStyle(
              color: status.chatBadgeTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
