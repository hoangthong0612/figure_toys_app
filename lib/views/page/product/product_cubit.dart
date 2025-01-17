import 'package:dio/dio.dart';
import 'package:figure_toys/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> data;

  ProductLoaded(this.data);
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final Dio _dio = Dio();

  Future fetchData() async {
    emit(ProductLoading());
    try {
      final response = await _dio.get('https://dummyjson.com/products');
      List<Product> products = (response.data['products'] as List<dynamic>)
          .map((item) => Product.fromJson(item))
          .toList();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


}



// class ProductState {
//   final List<Product>? data;
//   ProductState({this.data});
// }
