import 'dart:math';

import 'package:figure_toys/utils/response/auth.dart';
import 'package:figure_toys/utils/shared_preferences_manage.dart';
import 'package:figure_toys/views/page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/request/login.dart';
import '../common_function.dart';
import '../toast_view.dart';

class Authentication extends Cubit<AuthenticationState> {
  Authentication() : super(AuthenticationState());

  Future login(String login, String password, BuildContext context) async {
    if (isNullOrEmpty(login)) {
      return showErrorToast(
        "Email không được bỏ trống!",
      );
    }
    if (isNullOrEmpty(password)) {
      return showErrorToast(
        "Mật khẩu không được bỏ trống!",
      );
    }
    final request = LoginRequest();
    request.user = login;
    request.password = password;

    final response = await AuthenticationResponse.login(request);
    if (isNotNullOrEmpty(response.accessToken)) {
      await SharedPreferencesManage.setToken(response.accessToken ?? '');
      await SharedPreferencesManage.setValue(
          SharedPreferencesManage.account, login);
      await SharedPreferencesManage.setValue(
          SharedPreferencesManage.password, password);

      pushPage(context, MainPage());
      return showSuccessToast(
        'Đăng nhập thành công',
      );
    } else {
      return showErrorToast(
        "Thông tin tài khoản hoặc mật khẩu không chính xác!",
      );
    }
  }
}

class AuthenticationState {
  AuthenticationState();
}
