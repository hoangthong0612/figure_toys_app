import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.whiteColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black, // Bóng mờ
        //     offset: Offset(0, 2), // Đổ bóng theo trục x, y
        //     blurRadius: 4, // Độ mờ của bóng
        //   ),
        // ],
      ),
      child: Text(
        'Footer',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
