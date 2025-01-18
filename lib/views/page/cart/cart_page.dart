import 'package:figure_toys/views/widget/cart/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: CartWidget(),
          ),
        
      ),
    );
  }
  
}