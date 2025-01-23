import 'package:figure_toys/controllers/base.dart';
import 'package:figure_toys/controllers/product/product_cubit.dart';
import 'package:figure_toys/models/product_model.dart';
import 'package:figure_toys/utils/common_function.dart';
import 'package:figure_toys/views/page/product/product_detail_cubit.dart';
import 'package:figure_toys/views/widget/product/product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;

  const ProductDetailPage({super.key, required this.id, required this.name});

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
        create: (context) => ProductCubit()..getDataProductId(id: widget.id),
        child: BlocBuilder<ProductCubit, CubitState>(builder: (context, state) {
          if (state is LoadingCubit) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ));
          } else if (state is ProductState) {

            if (state.dataId != null) {
              return ProductDetailWidget(product: state.dataId  ?? Product());
            }
            return  Text('No data');
          } else if (state is ErrorCubit) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Center(child: Text('Press the button to load data'));
        }),
      ),
    );
  }
}
