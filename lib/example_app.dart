import 'package:flutter/material.dart';
import 'package:flutter_example/dependency/app_dependency.dart';
import 'package:flutter_example/feature/login/screen/login_screen.dart';
import 'package:flutter_example/feature/museum_list/screen/museum_list_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDependency(
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowMaterialGrid: false,
          initialRoute: 'login',
          routes: {
            'login': (_) => LoginScreen(),
            'museum_list': (_) => const MuseumListScreen()
          }),
    );
  }
}
