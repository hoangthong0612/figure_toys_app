class ProductRequest {
  int? id;
  String? name;
  int? categoryId;

  Map<String, dynamic> getParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["id"] = id;
    params["name"] = name;
    params["category_id"] = categoryId;
    return params;
  }
}
