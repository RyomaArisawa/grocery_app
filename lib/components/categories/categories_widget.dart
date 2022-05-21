import 'package:flutter/material.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.color})
      : super(key: key);
  final String catText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    final Color textColor =
        themeState.getDarkTheme ? Colors.white : Colors.black;
    final double _screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => print("pressed"),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            TextWidget(
              text: catText,
              color: textColor,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
