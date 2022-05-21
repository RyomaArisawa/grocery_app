import 'package:flutter/material.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:grocery_app/utils/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context: context);
    final color = utils.color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(text: "1.59\$", color: Colors.green, textSize: 22),
          const SizedBox(
            width: 5,
          ),
          Text(
            "2.59\$",
            style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
