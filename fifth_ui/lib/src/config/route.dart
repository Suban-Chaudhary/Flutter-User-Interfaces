import 'package:flutter/material.dart';
import 'package:practice_2/src/pages/HomePage.dart';
import 'package:practice_2/src/pages/NextPage.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/NextPage': (_) => HomePage(),
      '/': (_) => NextPage(),
    };
  }
}