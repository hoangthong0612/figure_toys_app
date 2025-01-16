import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_model.dart';
import 'product_cubit.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..fetchData(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          print(state);
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(

              itemCount: state.data.length,
              itemBuilder: (context, index) {
                print("state");
                print(state);
                final item = state.data[index];
                return Column(
                  children: [
                    Image.network(item['thumbnail']),
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(item['description'])
                  ],
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Center(child: Text('Press the button to load data'));
        },
      ),
    );
  }
}
