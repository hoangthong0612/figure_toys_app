import 'package:figure_toys/data/product_data.dart';
import 'package:figure_toys/views/components/product_cart.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product_model.dart';

class ListCartWidget extends StatelessWidget {
  const ListCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Product> products = ProductData().menu;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thông tin đơn hàng'),
            RichText(
              text: TextSpan(
                text: 'Tổng ',
                style: DefaultTextStyle.of(context).style,
                children:  <TextSpan>[
                  TextSpan(text: products.length.toString() , style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' sản phẩm'),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCartComponent(product: product);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
