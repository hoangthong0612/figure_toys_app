import 'package:figure_toys/views/page/product/product_detail_cubit.dart';
import 'package:figure_toys/views/widget/product/product_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;

  ProductDetailPage({required this.id, required this.name});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductDetailCubit()..fetchData(widget.id.toString()),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
          print(state);
          if (state is ProductDetailLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
          } else if (state is ProductDetailLoaded) {
            
            return ProductDetailWidget(product: state.data);
          } else if (state is ProductDetailError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Center(child: Text('Press the button to load data'));
        }),
      ),
    );
  }
}
