import 'api_caller.dart';

class SaveDataMethodApi {
  static const int typePost = 1, typeGet = 2;
  int? typeMethod;
  String? path;
  Map<String, dynamic>? params;
  dynamic responseData;

  SaveDataMethodApi(
      {this.typeMethod = 0, this.path, this.params, this.responseData});

  Future callApi() async {
    if (typeMethod == SaveDataMethodApi.typePost) {
      await ApiCaller.instance.post(path ?? "", params ?? {}, responseData);
    } else if (typeMethod == SaveDataMethodApi.typeGet) {
      await ApiCaller.instance.get(path ?? "", responseData, params: params);
    }
  }
}
