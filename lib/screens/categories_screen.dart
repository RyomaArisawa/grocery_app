import 'package:flutter/material.dart';
import 'package:grocery_app/components/categories/categories_widget.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:grocery_app/utils/utils.dart';

class CategoriesScreen extends StatelessWidget {
  List<Map<String, dynamic>> catInfo = [
    {"imgPath": "assets/images/cat/fruits.png", "catText": "Fruits"},
    {"imgPath": "assets/images/cat/grains.png", "catText": "Grains"},
    {"imgPath": "assets/images/cat/nuts.png", "catText": "Nuts"},
    {"imgPath": "assets/images/cat/spices.png", "catText": "Spices"},
    {"imgPath": "assets/images/cat/Spinach.png", "catText": "Spinach"},
    {"imgPath": "assets/images/cat/veg.png", "catText": "Veg"},
  ];

  @override
  Widget build(BuildContext context) {
    final util = Utils(context: context);
    Color color = util.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Categories",
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
              6,
              (index) => CategoriesWidget(
                    catText: catInfo[index]["catText"],
                    imgPath: catInfo[index]["imgPath"],
                    color: Colors.red,
                  )),
        ),
      ),
    );
  }
}
