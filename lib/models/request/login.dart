class LoginRequest {
  String? user;
  String? password;

  Map<String, dynamic> getParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["login"] = user;
    params["password"] = password;
    return params;
  }
}
