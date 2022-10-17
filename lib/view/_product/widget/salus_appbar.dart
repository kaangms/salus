import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../view/_product/constants/image_path_svg.dart';

class SalusAppBar extends AppBar {
  final BuildContext context;
  final bool hasBackButton;
  final String text;

  SalusAppBar({
    Key? key,
    required this.context,
    required this.text,
    this.hasBackButton = false,
  }) : super(
          toolbarHeight: 45,
          key: key,
          elevation: 0,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          backgroundColor: context.colors.background,
          leadingWidth: 0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                if (hasBackButton)
                  InkWell(
                    onTap: () => NavigationService.instance.navigateToPop(status: true),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        SVGImagePath.instance.backSVG,
                        height: 25,
                        // color: context.colors.onSurface,
                      ),
                    ),
                  ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 26, color: Colors.black),
                ),
              ],
            ),
          ),
          actions: [
            InkWell(
              onTap: null,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 5,
                  top: 2,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: SvgPicture.asset(
                    SVGImagePath.instance.profileSVG,
                    // color: context.colors.onSurface,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: null,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 5,
                  top: 2,
                  right: 20,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: SvgPicture.asset(
                    SVGImagePath.instance.notificationSVG,
                    // color: context.colors.onSurface,
                  ),
                ),
              ),
            ),
          ],
        );
}
