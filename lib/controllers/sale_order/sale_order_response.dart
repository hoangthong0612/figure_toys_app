import 'package:figure_toys/models/request/sale_order.dart';
import 'package:figure_toys/models/sale_order.dart';

import '../../utils/api_url.dart';
import '../../utils/request/method_data_api.dart';
import '../../utils/response/base.dart';

class SaleOrderResponse {
  static Future<BaseResponse> getData(SaleOrderRequest request) async {
    return await MethodDataApi<SaleOrder>().methodGet(
      linkApi: ApiUrl.saleOrder,
      model: SaleOrder(),
      map: request.getParams(),
    );
  }
}