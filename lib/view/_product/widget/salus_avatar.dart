import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../utility/salus_extensions.dart';

class SalusAvatar extends StatelessWidget {
  const SalusAvatar({
    Key? key,
    this.name = '',
    this.surname = '',
    this.isOnline = false,
  }) : super(key: key);
  final String? name;
  final String? surname;
  final bool? isOnline;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: context.colors.onPrimary,
          child: Text(
            name.avatarFirstChar + surname.avatarFirstChar,
            style: TextStyle(
              color: context.colors.onSecondary,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: isOnline!
              ? Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: isOnline.getColorForOnlineStatus,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
