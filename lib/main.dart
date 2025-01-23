import 'package:figure_toys/views/layout/main_layout.dart';
import 'package:figure_toys/views/page/dashboard/dashboard_page.dart';
import 'package:figure_toys/views/page/login.dart';
import 'package:figure_toys/views/page/main_page.dart';
import 'package:figure_toys/views/page/product/product_detail_page.dart';
import 'package:figure_toys/views/page/product/product_page.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> mainGlobalKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: mainGlobalKey,
      scaffoldMessengerKey: snackbarKey,
      home: MainPage(),
    );
  }
}
