import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    // Hiển thị thông tin trong Console
    print('Email: $email');
    print('Password: $password');

    // Thêm logic kiểm tra hoặc gọi API tại đây
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thành công với email: $email')),
      );
    }
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
                              this._handleLogin();
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
