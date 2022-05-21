import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {"page": HomeScreen(), "title": "Home Screen"},
    {"page": CategoriesScreen(), "title": "Categories Screen"},
    {"page": const CartScreen(), "title": "Cart Screen"},
    {"page": const UserScreen(), "title": "User Screen"},
  ];

  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        onTap: _selected,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(IconlyBold.home)
                  : const Icon(IconlyLight.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(IconlyBold.category)
                  : const Icon(IconlyLight.category),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(IconlyBold.buy)
                  : const Icon(IconlyLight.buy),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? const Icon(IconlyBold.user2)
                  : const Icon(IconlyLight.user2),
              label: "User"),
        ],
      ),
    );
  }
}
