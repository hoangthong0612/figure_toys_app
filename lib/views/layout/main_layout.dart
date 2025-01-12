import 'package:figure_toys/data/menu_data.dart';
import 'package:figure_toys/views/widget/header/header_widget.dart';
import 'package:figure_toys/views/widget/menu/menu_side_widget.dart';
import 'package:flutter/material.dart';


class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedMenuIndex = 0; // Trạng thái lưu menu được chọn

  void _onMenuSelected(int index) {
    setState(() {
      selectedMenuIndex = index; // Cập nhật index khi nhận từ SideMenuWidget
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuData = SideMenuData();
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xff2f3640),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 85,
                      ),
                      Expanded(
                        child: SideMenuWidget(onMenuSelected: _onMenuSelected),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  HeaderWidget(),
                  Expanded(
                    child: Center(
                      child: menuData.menu[selectedMenuIndex].widget,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
