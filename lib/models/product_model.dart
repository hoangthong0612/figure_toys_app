class Product {
  int? id;
  String? name;
  String? thumbnail;
  List<String>? images;
  String? priceFormat;
  double? price;
  String? descriptionSale;
  String? descriptionEcommerce;
  List<Category>? category;

  Product(
      {this.id,
        this.name,
        this.thumbnail,
        this.images,
        this.priceFormat,
        this.price,
        this.descriptionSale,
        this.descriptionEcommerce,
        this.category});

  Product fromJson(dynamic json) {
    return Product.fromJson(json);
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
    priceFormat = json['price_format'];
    price = json['price'];
    descriptionSale = json['description_sale'];
    descriptionEcommerce = json['description_ecommerce'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    data['price_format'] = priceFormat;
    data['price'] = price;
    data['description_sale'] = descriptionSale;
    data['description_ecommerce'] = descriptionEcommerce;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}