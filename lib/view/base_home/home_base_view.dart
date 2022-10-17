// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/extensions/context_extensions.dart';
import '../_product/constants/image_path_svg.dart';
import '../chat/view/chat_view.dart';
import '../home/home_view.dart';
import 'home_base_cubit.dart';

class HomeBaseView extends StatelessWidget {
  HomeBaseView({
    Key? key,
    this.pageIndex,
  }) : super(key: key);
  int? pageIndex;
  final _pageNavigation = [const HomeView(), const ChatView()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBaseCubit(pageIndex ?? 0),
      child: WillPopScope(onWillPop: () async => false, child: _scaffold(context)),
    );
  }

  Widget _scaffold(BuildContext context) {
    return BlocBuilder<HomeBaseCubit, int>(
      builder: (context, state) {
        return Scaffold(
            body: _pageNavigation[state],
            bottomNavigationBar: Container(
              height: 100,
              decoration: BoxDecoration(
                color: context.colors.primary,
                border: Border.all(
                  color: context.colors.surface,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildbottomNavigationItem(context, SVGImagePath.instance.homeSVG, 'Anasayfa', 0),
                    buildbottomNavigationItem(context, SVGImagePath.instance.messageSVG, 'Mesajlarım', 1),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget buildbottomNavigationItem(BuildContext context, String imagePath, String title, int index) {
    return InkWell(
      onTap: () => context.read<HomeBaseCubit>().updateIndex(index),
      child: Column(
        children: [
          Container(
            decoration: context.read<HomeBaseCubit>().state == index
                ? BoxDecoration(
                    color: context.colors.shadow,
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
              child: SvgPicture.asset(
                imagePath,
                color: context.read<HomeBaseCubit>().state == index ? context.colors.primaryContainer : context.colors.secondary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
