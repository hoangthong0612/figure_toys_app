class SaleOrder {
  SaleOrder({
    this.id,
    this.name,
    this.partnerId,
    this.amountTotalFormat,
    this.amountTotal,
  });

  SaleOrder fromJson(dynamic json) {
    return SaleOrder.fromJson(json);
  }

  SaleOrder.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    partnerId = json['partner_id'] != null
        ? PartnerId.fromJson(json['partner_id'])
        : null;
    amountTotalFormat = json['amount_total_format'];
    amountTotal = json['amount_total'];
  }

  int? id;
  String? name;
  PartnerId? partnerId;
  String? amountTotalFormat;
  double? amountTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (partnerId != null) {
      map['partner_id'] = partnerId?.toJson();
    }
    map['amount_total_format'] = amountTotalFormat;
    map['amount_total'] = amountTotal;
    return map;
  }
}

/// id : 11
/// name : "Gemini Furniture"

class PartnerId {
  PartnerId({
    this.id,
    this.name,
  });

  PartnerId.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
