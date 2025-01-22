import 'package:figure_toys/views/page/product/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/common_function.dart';
import '../../utils/shared_preferences_manage.dart';
import '../layout/main_layout.dart';
import 'dashboard/dashboard_page.dart';
import 'login.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  bool isLogin = false;
  Future checkToken() async {
    String? token = await SharedPreferencesManage.getToken();
    if (isNullOrEmpty(token)) {
      setState(() {
        isLogin = false;
      });
    }else {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  void initState() {
    checkToken();
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLogin ? Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: MainLayout(
        initialPage: 'home',
        pages: {
          'home': HomeScreen(),
          'product': ProductPage(),
          'another': Text('Another Page'),
        },
      ),
    )  : LoginPage();
  }
}