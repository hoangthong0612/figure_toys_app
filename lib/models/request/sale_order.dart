class SaleOrderRequest {
  int? id;
  String? name;

  Map<String, dynamic> getParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["id"] = id;
    params["name"] = name;
    return params;
  }
}
