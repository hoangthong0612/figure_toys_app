import 'package:figure_toys/controllers/base.dart';
import 'package:figure_toys/controllers/product/product_response.dart';
import 'package:figure_toys/models/product_model.dart';
import 'package:figure_toys/models/request/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_constant.dart';

class ProductCubit extends Cubit<CubitState> {
  ProductCubit() : super(InitCubit()) ;

  Future getDataProduct({int? id, String? name, int? categoryId}) async{
    final request = ProductRequest() ;
    request.name = name;
    request.id = id;
    request.categoryId = categoryId;
    emit(LoadingCubit());

    try {
      final response = await ProductResponse.getDataProduct(request);

      emit(ProductState(data: response.data));
    } catch (e) {
      emit(ErrorCubit(e.toString()));
    }
  }

  Future getDataProductId({required int id}) async{
    final request = ProductRequest() ;
    request.id = id;
    emit(LoadingCubit());

    try {
      final response = await ProductResponse.getDataProduct(request);
      if (response.status == Constant.statusSuccess) {
        emit(ProductState(dataId: response.data));
      }else {
        emit(ProductState(dataId: null));
      }
    } catch (e) {
      emit(ErrorCubit(e.toString()));
    }
  }
}

class ProductState extends CubitState{
  final List<Product>? data;
  final Product? dataId;
  ProductState({ this.data, this.dataId});
}
