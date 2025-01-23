class Token {
  int? uid;
  UserContext? userContext;
  int? companyId;
  List<int>? companyIds;
  int? partnerId;
  String? accessToken;
  bool? companyName;
  String? name;

  Token(
      {this.uid,
      this.userContext,
      this.companyId,
      this.companyIds,
      this.partnerId,
      this.accessToken,
      this.companyName,
      this.name});

  Token.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userContext = json['user_context'] != null
        ? UserContext.fromJson(json['user_context'])
        : null;
    companyId = json['company_id'];
    companyIds = json['company_ids'].cast<int>();
    partnerId = json['partner_id'];
    accessToken = json['access_token'];
    companyName = json['company_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    if (userContext != null) {
      data['user_context'] = userContext!.toJson();
    }
    data['company_id'] = companyId;
    data['company_ids'] = companyIds;
    data['partner_id'] = partnerId;
    data['access_token'] = accessToken;
    data['company_name'] = companyName;
    data['name'] = name;
    return data;
  }
}

class UserContext {
  String? lang;
  String? tz;
  int? uid;

  UserContext({this.lang, this.tz, this.uid});

  UserContext.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    tz = json['tz'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lang'] = lang;
    data['tz'] = tz;
    data['uid'] = uid;
    return data;
  }
}
