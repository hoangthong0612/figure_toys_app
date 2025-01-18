import 'package:figure_toys/views/widget/cart/list_cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        children: [
          SizedBox(width: 25,),
          Expanded(
            flex: 2,
            child: ListCartWidget(),
          ),
          SizedBox(width: 25,),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.black,
            ),
          ),
          SizedBox(width: 25,),
        ],
      ),
    );
  }
}
