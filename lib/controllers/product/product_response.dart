import 'package:figure_toys/models/product_model.dart';
import 'package:figure_toys/models/request/product.dart';
import 'package:figure_toys/utils/response/base.dart';

import '../../utils/api_url.dart';
import '../../utils/request/method_data_api.dart';

class ProductResponse {
  static Future<BaseResponse> getDataProduct(ProductRequest request) async {
    return await MethodDataApi<Product>().methodGet(
      linkApi: ApiUrl.product,
      model: Product(),
      map: request.getParams(),
    );
  }
}
