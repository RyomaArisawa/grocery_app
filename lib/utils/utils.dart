import 'package:flutter/material.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils({required this.context});

  bool get getTheme => context.watch<DarkThemeProvider>().getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get screenSize => MediaQuery.of(context).size;
}
