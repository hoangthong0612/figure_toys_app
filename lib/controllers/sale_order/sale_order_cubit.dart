import 'package:figure_toys/controllers/sale_order/sale_order_response.dart';
import 'package:figure_toys/models/request/sale_order.dart';
import 'package:figure_toys/models/sale_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base.dart';

class SaleOrderCubit extends Cubit<CubitState> {
  SaleOrderCubit() : super(InitCubit());

  Future getSaleOrder ({int? id}) async {
      final request = SaleOrderRequest();
      request.id = id;

      emit(LoadingCubit());
      try {
        final response = await SaleOrderResponse.getData(request);

        emit(SaleOrderState(data: response.data));
      } catch (e) {
        emit(ErrorCubit(e.toString()));
      }

  }
}

class SaleOrderState extends CubitState {
    List<SaleOrder>? data;

    SaleOrderState({this.data});
}
