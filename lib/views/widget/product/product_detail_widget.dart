import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductDetailWidget extends StatelessWidget {
  final Product product;

  const ProductDetailWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Center(
            child: Image.network(
              product.thumbnail ?? '',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(product.title ?? ''),
        Text(product.description ?? ''),
      ],
    );
  }
}
