import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/app_navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';

void main() async {
  _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: const SalusApp(),
  ));
}

void _init() {
  WidgetsFlutterBinding.ensureInitialized();
}

class SalusApp extends StatelessWidget {
  const SalusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      onGenerateRoute: AppNavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
