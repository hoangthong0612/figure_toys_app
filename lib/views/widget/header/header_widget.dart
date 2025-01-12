import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeaderWidgetState();

}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50,
      child: Container(
        color: Colors.deepOrange,
      ),
    );
  }

}