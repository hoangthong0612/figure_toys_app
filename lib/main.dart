import 'package:figure_toys/views/layout/main_layout.dart';
import 'package:figure_toys/views/widget/menu/menu_side_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainLayout()
    );
  }
}
