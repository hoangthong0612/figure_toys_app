
import '../response/base.dart';
import '../toast_view.dart';
import 'api_caller.dart';

class MethodDataApi<T> {
  bool? isShowSuccess;
  bool? isShowError;

  MethodDataApi({this.isShowSuccess = false, this.isShowError = false});

  Future<BaseResponse> methodGet(
      {required String linkApi,
        dynamic model,
        Map<String, dynamic>? map,
        bool isLoading = true}) async {
    try {
      final response = await ApiCaller.instance
          .get(linkApi, model, params: map, isLoading: isLoading);
      return setDataResponse(response);
    } catch (error) {
      showErrorToast(error.toString());
      throw Exception(error);
    }
  }

  Future<BaseResponse> methodPost({
    required String linkApi,
    dynamic model,
    required Map<String, dynamic> map,
    bool isLoading = true,
  }) async {
    try {
      final response = await ApiCaller.instance.post(
        linkApi,
        map,
        model,
        isLoading: isLoading,
      );
      return setDataResponse(response);
    } catch (error) {
      showErrorToast(error.toString());
      throw Exception(error);
    }
  }

  BaseResponse setDataResponse(BaseResponse response) {
    // if (T == null || response.data == null) {
    //   print("response null");
    //   return response;
    // }
    switch (response.status) {
      case 0:
        if (response.data is List) {
          response.data = List<T>.from(response.data.map((v) => v));
        } else {
          response.data as T;
        }
        if (isShowSuccess == true) {
          showSuccessToast(response.message?.content ?? "");
          print(response.message?.content);
        }
        return response;
      case 1:
        if (isShowError == true || response.message?.type == 2) break;

        showErrorToast(response.message?.content ?? "");
        // print(response.message?.content);
        return response;
    }
    showErrorToast(response.message?.content ?? "");
    return response;
  }
}
// status =  0 || message & type = 0: thành công
// status =  1: thất bại
// status = 1,  message & type = 1: Logout hoặc Giá trị Authorization trong header không chính xác
// status = 0, message & type = 2: Thiếu giá trị Authorization trong header
