import 'package:figure_toys/views/layout/main_layout.dart';
import 'package:figure_toys/views/page/dashboard/dashboard_page.dart';
import 'package:figure_toys/views/page/login.dart';
import 'package:figure_toys/views/page/product/product_detail_page.dart';
import 'package:figure_toys/views/page/product/product_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? MainLayout(
        initialPage: 'home',
        pages: {
          'home': HomeScreen(),
          'product': ProductPage(),
          'another': Text('Another Page'),
        },
      ) : LoginPage(),




    );
  }
}
