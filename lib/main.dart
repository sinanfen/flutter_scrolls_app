import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scrolls_app/card_listtile.dart';
import 'package:flutter_scrolls_app/listview_kullanimi.dart';
import 'package:flutter_scrolls_app/listview_layout_problemleri.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow.shade100
    ..backgroundColor = Colors.green.shade100
    ..indicatorColor = Colors.yellow.shade100
    ..textColor = Colors.yellow.shade100
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListviewLayoutProblemleri(),
      builder: EasyLoading.init(),
    );
  }
}
