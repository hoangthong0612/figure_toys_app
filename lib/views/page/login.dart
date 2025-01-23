import 'dart:ui';

import 'package:figure_toys/utils/auth/auth.dart';
import 'package:figure_toys/utils/common_function.dart';
import 'package:figure_toys/views/layout/main_layout.dart';
import 'package:figure_toys/views/page/main_page.dart';
import 'package:figure_toys/views/page/product/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/shared_preferences_manage.dart';
import 'dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');
  final _cubit = Authentication();
  Future<void> _handleLogin(BuildContext content) async {
    _cubit.login(emailController.text, passwordController.text, context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/bg-desktop.jpg',
                fit: BoxFit.cover,
              ),
              Center(
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    // Hiệu ứng blur
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width < 500 ? MediaQuery.of(context).size.width / 5 * 4 : 500,
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.2), // Nền mờ (semi-transparent)

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.2),
                        //     blurRadius: 10,
                        //     offset: const Offset(0, 5),
                        //   ),
                        // ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/primary-logo.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 30),
                          // Ô nhập Email
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          // Ô nhập Mật khẩu
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              hoverColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white, width: 2),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          // Nút Đăng nhập
                          ElevatedButton(
                            onPressed: () {
                              // Thực hiện logic đăng nhập
                              _handleLogin(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'Đăng Nhập',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.deepOrange),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
