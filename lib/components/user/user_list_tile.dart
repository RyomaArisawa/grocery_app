import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UserListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData leading;
  final VoidCallback? onPressed;

  UserListTile(
      {required this.title,
      this.subtitle,
      required this.leading,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return ListTile(
      leading: Icon(leading),
      title: TextWidget(
        text: title,
        color: color,
        textSize: 24,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        textSize: 18,
        isTitle: false,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: onPressed,
    );
  }
}
