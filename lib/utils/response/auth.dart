import 'package:dio/dio.dart';
import 'package:figure_toys/models/token_model.dart';

import '../../models/request/login.dart';
import '../api_url.dart';
import '../request/api_caller.dart';
import '../request/method_data_api.dart';
import 'base.dart';

class AuthenticationResponse {
  static Future<Token> login(LoginRequest request) async {
    final dio = Dio();
    try {
      Response response = await dio.get('${ApiUrl.baseUrl}/api${ApiUrl.token}',
          queryParameters: request.getParams());
      print(response);
      if (response.statusCode == 200) {
        return Token.fromJson(response.data);
      }
      return Token(accessToken: '');
    } on DioError catch (e) {
      return Token(accessToken: '');
    }




    // try {
    //   final response = await ApiCaller.instance
    //       .get('${ApiUrl.baseUrl}/api${ApiUrl.token}', Token(), params:  request.getParams(), isLoading: true);
    //   print('response');
    //   print(response.toString());
    //   return Token(accessToken: '123123123123');
    // } catch (error) {
    //   // showErrorToast(error.toString());
    //   throw Exception(error);
    // }
    // return await MethodDataApi<Token>().methodGet(
    //   linkApi: ApiUrl.token,
    //   model: Token(),
    //   map: request.getParams(),
    // );
  }
}
