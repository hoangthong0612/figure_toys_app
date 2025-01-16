import 'package:dio/dio.dart';
import 'package:figure_toys/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<dynamic> data;

  ProductLoaded(this.data);
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final Dio _dio = Dio();

  Future<void> fetchData() async {
    emit(ProductLoading()); // Báo hiệu trạng thái đang load
    try {
      final response = await _dio.get('https://dummyjson.com/products');
      print(response.data['products']);
      emit(ProductLoaded(response.data['products'])); // Cập nhật trạng thái khi có dữ liệu
    } catch (e) {
      emit(ProductError(e.toString())); // Xử lý lỗi
    }
  }

}



// class ProductState {
//   final List<Product>? data;
//   ProductState({this.data});
// }
