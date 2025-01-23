import 'dart:convert';
import 'dart:io';

// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:figure_toys/utils/request/save_data_method_api.dart';

import '../../main.dart';
import '../api_url.dart';
import '../app_constant.dart';
import '../common_function.dart';
import '../response/base.dart';
import '../shared_preferences_manage.dart';


typedef ProgressListener = void Function(int total, int progress, int percent);

class ApiCaller {
  static const int timeOutCode = 900;
  static const int dioErrorDefault = 901;
  static const int dioErrorResponse = 902;
  static const int dioErrorNoReason = 903;
  int timeOut = 60000;

  static final ApiCaller _instance = ApiCaller();
  late Dio _dio;

  late SaveDataMethodApi saveDataMethodApi;

  static ApiCaller get instance {
    return _instance;
  }

  ApiCaller() {
    _dio = Dio();
    // (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
    //     (client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) {
    //     return true;
    //   };
    //   return null;
    // };
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
        HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = await SharedPreferencesManage.getToken();
      String? baseUrl = await SharedPreferencesManage.getValue(
          SharedPreferencesManage.baseURL);
      // String? token = "access_token_633319ef7e574f6dd5afafd8b8d963333e513d0e";
      var customHeaders = {
        Headers.acceptHeader: Headers.jsonContentType,
        HttpHeaders.authorizationHeader: token
      };
      options.baseUrl = "${baseUrl ?? ApiUrl.baseUrl}/api/";
      options.responseType = ResponseType.plain;
      options.connectTimeout = Duration(milliseconds: timeOut);
      options.receiveTimeout = Duration(milliseconds: timeOut);
      options.sendTimeout = Duration(milliseconds: timeOut) ;
      options.headers.addAll(customHeaders);
      return handler.next(options);
    }));

    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<dynamic> post(
      String path, Map<String, dynamic> params, dynamic responseData,
      {bool isLoading = true}) async {
    saveDataMethodApi = SaveDataMethodApi(
      typeMethod: SaveDataMethodApi.typePost,
      params: params,
      path: path,
      responseData: responseData,
    );
    printParams(params, path);
    if (isLoading) {
      showLoading();
    }
    try {
      var param = FormData.fromMap(params);
      Response response = await _dio.post(path, data: param);
      return _response(response, responseData);
    } on DioError catch (ex) {
      return _errorException(dioError: ex);
    } on Exception {
      return _errorException();
    } finally {
      if (isLoading) {
        hideLoading();
      }
    }
  }

  Future<dynamic> get(String path, dynamic responseData,
      {Map<String, dynamic>? params, bool isLoading = true}) async {
    // if (isNullOrEmpty(params)) params = {};
    saveDataMethodApi = SaveDataMethodApi(
      typeMethod: SaveDataMethodApi.typeGet,
      params: params,
      path: path,
      responseData: responseData,
    );
    printParams(params, path);
    if (isLoading) {
      showLoading();
    }
    try {
      Response response = await _dio.get(path, queryParameters: params);
      return _response(response, responseData);
    } on DioException catch (ex) {
      return _errorException(dioError: ex);
    } on Exception {
      return _errorException();
    } finally {
      if (isLoading) {
        hideLoading();
      }
    }
  }

  Future<BaseResponse?> _errorException(
      {String message = "Kết nối đến máy chủ thất bại.",
        DioError? dioError,
        int code = 0}) async {
    // String resultCode = "";
    if (dioError != null) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          message = "Máy chủ không phản hồi";
          code = timeOutCode;
          return BaseResponse(
              message: MessageResponse(content: message, type: code),
              status: 500);
        case DioExceptionType.unknown:
          {
            message = "Không tìm thấy máy chủ";
            code = dioErrorDefault;
            // Future.delayed(Duration.zero, () {
            //   internetDialog?.showDialog(
            //     onRetry: () async {
            //       saveDataMethodApi.callApi();
            //       if (isNotNullOrEmpty(saveDataMethodApi)) {
            //         if (saveDataMethodApi.typeMethod ==
            //             SaveDataMethodApi.typePost) {
            //           post(
            //               saveDataMethodApi.path ?? "",
            //               saveDataMethodApi.params ?? {},
            //               saveDataMethodApi.responseData);
            //         } else if (saveDataMethodApi.typeMethod ==
            //             SaveDataMethodApi.typeGet) {
            //           get(saveDataMethodApi.path ?? "",
            //               saveDataMethodApi.responseData,
            //               params: saveDataMethodApi.params);
            //         }
            //       }
            //     },
            //   );
            // });
            return BaseResponse(
                message: MessageResponse(content: message, type: code));
          }
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
          {
            return _response(dioError.response!, null);
          }
      // case DioErrorType.cancel:
      //   // TODO: Handle this case.
      //   break;
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.connectionError:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    }
    return null;
  }

  BaseResponse _response(Response response, dynamic responseData) {
    String message = '';
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.data.toString());
        BaseResponse data = BaseResponse.fromJson(responseJson, responseData);
        // Future.delayed(Duration.zero, () {
        //   if (data.status == 1 && data.message?.type == 1) {
        //     print("LOGOUT");
        //     SharedPreferencesManage.removeValue();
        //     pushAndRemoveUntil(
        //         mainGlobalKey.currentContext!, const IntroPage());
        //   }
        // });
        return data;
      case 400:
        message = "Cú pháp không hợp lệ (400)";
        break;

      case 401:
      case 403:
        message = "Có vấn đề khi xác thực trong tài khoản của bạn (403)";
        break;

      case 404:
        message = "Không thể truy cập đến máy chủ (404)";
        break;

      case 500:
        message = "Máy chủ gặp lỗi (500)";
        break;

      default:
        message = "Kết nối đến máy chủ thất bại";
        break;
    }
    return BaseResponse(
      status: Constant.statusApiError,
      message: MessageResponse(
        content: message,
        type: response.statusCode,
      ),
    );
  }

  void printParams(Map<String, dynamic>? params, String path) {
    if (isNullOrEmpty(params)) {
      print("param for $path:   $params");
      return;
    }
    StringBuffer sb = StringBuffer();
    for (String key in params!.keys) {
      // sb.write("$key:${params[key]}\n");
      String paramData = params[key].toString();
      sb.write(
          "$key:${paramData.length > 100 ? '${paramData.substring(0, 100)}...' : paramData}\n");
    }
    String result = sb.toString();

    int count = (result.length / 900).ceil();
    int end = 0;
    for (int i = 0; i < count; i++) {
      end = (i + 1) * 900;
      if (end > result.length) {
        end = result.length;
      }
      print("param for $path[$i]:  ${result.substring(i * 900, end)}");
    }
  }

  // Future<dynamic> uploadFile(
  //     String path, Map<String, dynamic>? params, dynamic responseData,
  //     {ProgressListener? sendListener, bool isLoading = true}) async {
  //   printParams(params, path);
  //   if (isLoading) {
  //     loadingDialog?.show(isShowImmediate: true);
  //   }
  //   dynamic responseJson;
  //   try {
  //     var formData = FormData.fromMap(params!);
  //     Response response = await _dio.post(path, data: formData,
  //         onSendProgress: (int count, int total) {
  //       if (sendListener != null) {
  //         sendListener(total, count, 100.0 * count ~/ total);
  //       }
  //     });
  //     responseJson = _response(response, responseData);
  //   } on DioError catch (ex) {
  //     return _errorException(dioError: ex);
  //   } on Exception {
  //     return _errorException();
  //   } finally {
  //     if (isLoading) {
  //       hideLoading();
  //     }
  //   }
  //   return responseJson;
  // }

  void showLoading() {
    print("Loading");
  }

  void hideLoading() {
    print("Hide Loading");
  }
}
