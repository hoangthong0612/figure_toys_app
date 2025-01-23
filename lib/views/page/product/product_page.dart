import 'package:figure_toys/controllers/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/product/product_cubit.dart';
import '../../../models/product_model.dart';
import '../../components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getDataProduct(),
      child: BlocBuilder<ProductCubit, CubitState>(
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width ;
          if (state is LoadingCubit) {
            return Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
          } else if (state is ProductState) {
            final List<Product> products = state.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 1280 ? 8 : width > 720 ? 4 : 2, // Number of columns
                mainAxisSpacing: 8, // Spacing between rows
                crossAxisSpacing: 8, // Spacing between columns
                childAspectRatio: 0.7, // Aspect ratio of each grid item
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            );
          } else if (state is ErrorCubit) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Center(child: Text('Press the button to load data'));
        },
      ),
    );
  }
}
