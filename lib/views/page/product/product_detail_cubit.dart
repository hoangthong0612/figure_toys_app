import 'package:dio/dio.dart';
import 'package:figure_toys/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product data;

  ProductDetailLoaded(this.data);
}

class ProductDetailError extends ProductDetailState {
  final String error;

  ProductDetailError(this.error);
}

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  final Dio _dio = Dio();

  Future fetchData(String id) async {
    emit(ProductDetailLoading());
    try {
      final response = await _dio.get('https://dummyjson.com/products/' + id);
      // print(product);
      emit(ProductDetailLoaded(Product.fromJson(response.data)));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}

// class ProductState {
//   final List<Product>? data;
//   ProductState({this.data});
// }
