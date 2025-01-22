import 'package:figure_toys/utils/colors.dart';
import 'package:figure_toys/utils/common_function.dart';
import 'package:figure_toys/utils/shared_preferences_manage.dart';
import 'package:figure_toys/views/page/login.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onToggleMenu;
  final ValueNotifier<bool> isMenuVisible; // Trạng thái menu

  const Header({
    required this.onToggleMenu,
    required this.isMenuVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.whiteColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black, // Bóng mờ
        //     offset: Offset(0, 2), // Đổ bóng theo trục x, y
        //     blurRadius: 4, // Độ mờ của bóng
        //   ),
        // ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            icon: ValueListenableBuilder<bool>(
              valueListenable: isMenuVisible,
              builder: (context, isVisible, child) {
                return Icon(
                  isVisible ? Icons.arrow_back_outlined : Icons.menu,
                  // Hiển thị icon khác nhau
                  color: Colors.black,
                );
              },
            ),
            onPressed: onToggleMenu, // Gọi callback để ẩn/hiện menu
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Header',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
              child: IconButton(
                  onPressed: () => {clickLogout(context)},
                  icon: Icon(Icons.logout))),
        ],
      ),
    );
  }

  clickLogout(BuildContext context) async {
    await SharedPreferencesManage.removeValue();

    pushAndRemoveUntil(context, LoginPage());
  }
}
