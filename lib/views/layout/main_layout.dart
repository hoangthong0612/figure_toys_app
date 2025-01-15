import 'package:figure_toys/utils/colors.dart';
import 'package:flutter/material.dart';
import '../widget/footer/footer_widget.dart';
import '../widget/header/header_widget.dart';
import '../widget/menu/menu_side_widget.dart';

class MainLayout extends StatefulWidget {
  final Map<String, Widget> pages;
  final String initialPage;

  const MainLayout({
    required this.pages,
    required this.initialPage,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>  with TickerProviderStateMixin {
  late ValueNotifier<String> currentPage;
  late ValueNotifier<bool> isMenuVisible;
  late AnimationController _menuController;
  late Animation<Offset> _menuAnimation;
  @override
  void initState() {
    super.initState();
    currentPage = ValueNotifier<String>(
        widget.initialPage); // Trạng thái của trang hiện tại
    isMenuVisible = ValueNotifier<bool>(true); // Trạng thái của menu

    // Animation controller for the side menu transition
    _menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300), // Duration of the transition
    );

    // Animation for menu sliding effect
    _menuAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),  // Start position (outside the screen)
      end: Offset(0.0, 0.0),     // End position (in the screen)
    ).animate(CurvedAnimation(
      parent: _menuController,
      curve: Curves.easeInOut, // Smooth transition curve
    ));
  }

  @override
  void dispose() {
    currentPage.dispose();
    isMenuVisible.dispose();
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Row(
        children: [
          // Menu trái (ẩn/hiện dựa trên isMenuVisible)

          ValueListenableBuilder<bool>(
            valueListenable: isMenuVisible,
            builder: (context, isVisible, child) {
              if (isVisible) {
                _menuController.forward();
                return SlideTransition(
                  position: _menuAnimation, // Apply animation here
                  child: ValueListenableBuilder<String>(
                    valueListenable: currentPage,
                    builder: (context, page, child) {
                      return SideMenu(
                        currentPage: currentPage.value,
                        // Truyền currentPage vào SideMenu
                        onPageSelected: (page) {
                          currentPage.value =
                              page; // Cập nhật currentPage khi nhấn vào menu
                        },
                      );
                    },
                  ),);
              } else {
                _menuController.reverse();
                return SizedBox.shrink();
              }

            },
          ),
          // Nội dung chính

          Expanded(
            child: Column(
              children: [
                Header(
                  isMenuVisible: isMenuVisible,
                  onToggleMenu: () {
                    isMenuVisible.value = !isMenuVisible.value;
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<String>(
                    valueListenable: currentPage,
                    builder: (context, page, child) {
                      return widget.pages[page] ??
                          Center(
                            child: Text('Page not found!'),
                          );
                    },
                  ),
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
