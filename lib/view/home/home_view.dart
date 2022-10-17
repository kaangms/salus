import 'package:flutter/material.dart';

import '../_product/widget/salus_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalusAppBar(context: context, text: 'AnaSayfa'),
    );
  }
}
