import 'package:flutter/material.dart';
import 'package:practice_2/src/config/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care',
      routes: Routes.getRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}

