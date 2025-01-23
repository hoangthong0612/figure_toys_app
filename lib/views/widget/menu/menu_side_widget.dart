import 'package:figure_toys/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../data/menu_data.dart';

class SideMenu extends StatefulWidget {
  final Function(String) onPageSelected;
  final String currentPage; // Trang hiện tại

  const SideMenu({super.key,
    required this.onPageSelected,
    required this.currentPage,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      width: 250,
      color: CustomColor.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(height: 150,child: Image(image: AssetImage('assets/images/logo.png')) , ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemBuilder: (context, index) => _builderMenuEntry(data, index),
                itemCount: data.menu.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderMenuEntry(SideMenuData data, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: widget.currentPage == data.menu[index].route
              ? Colors.deepOrange
              : Colors.transparent),
      child: InkWell(
        onTap: () =>
            // onPageSelected(route);
            widget.onPageSelected(
                data.menu[index].route) // Gửi index về MainLayout
        ,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Icon(
                data.menu[index].icon,
                color: widget.currentPage == data.menu[index].route
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Text(
              data.menu[index].name,
              style: TextStyle(
                  fontSize: 16,
                  color: widget.currentPage == data.menu[index].route
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
