import 'package:figure_toys/utils/common_function.dart';
import 'package:figure_toys/views/page/product/product_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductCartComponent extends StatefulWidget {
  final Product product;

  const ProductCartComponent({super.key, required this.product});

  @override
  State<ProductCartComponent> createState() => _ProductCartComponentState();
}

class _ProductCartComponentState extends State<ProductCartComponent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        InkWell(
          onTap: () => {
            pushPage(context, ProductDetailPage(id: widget.product.id ?? 0 , name: widget.product.title ?? ''))
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 1,
                  offset: Offset(1, 2), // Shadow position
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  '${widget.product.thumbnail}',
                  width: 85,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product.title}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        widget.product.description ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => {}, child: Text('-')),
                    SizedBox(
                      width: 50,
                      child: Center(
                        child: Text('1'),
                      ),
                    ),
                    ElevatedButton(onPressed: () => {}, child: Text('+'))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.product.price} VNĐ'
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
