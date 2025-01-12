import 'package:figure_toys/data/menu_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  final Function(int) onMenuSelected; // Callback để gửi index

  SideMenuWidget({required this.onMenuSelected});
  @override
  State<StatefulWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final data = SideMenuData();
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => _builderMenuEntry(data, index),
        itemCount: data.menu.length,
      ),
    );
  }

  Widget _builderMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: isSelected ? Colors.deepOrange : Colors.transparent

      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
          widget.onMenuSelected(index); // Gửi index về MainLayout
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.white :Colors.grey,
              ),
            ),
            Text(
              data.menu[index].name,
              style: TextStyle(
                fontSize: 16,
                  color: isSelected ? Colors.white :Colors.grey,
                fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}
