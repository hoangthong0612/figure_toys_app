import 'package:figure_toys/models/menu_model.dart';
import 'package:figure_toys/views/page/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.home, name: "Trang chủ" , route: 'home'),
    MenuModel(icon: Icons.production_quantity_limits_outlined, name: "Sản phẩm", route: 'product'),
    MenuModel(icon: Icons.point_of_sale, name: "Đơn hàng" ,route: 'saleOrder'),
  ];

}