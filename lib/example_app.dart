import 'package:flutter/material.dart';
import 'package:flutter_example/dependency/app_dependency.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDependency(
        child: MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Hello World!')),
      ),
    ));
  }
}
