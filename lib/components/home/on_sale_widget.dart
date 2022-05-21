import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:grocery_app/components/home/price_widget.dart';
import 'package:grocery_app/utils/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context: context);
    final themeState = utils.getTheme;
    final color = utils.color;
    final size = utils.screenSize;

    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://i.ibb.co/F0s3FHQ/Apricots.png",
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(text: "1KG", color: color, textSize: 22),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: color,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              size: 22,
                              color: color,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const PriceWidget(),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: "Product title",
                color: color,
                textSize: 16,
                isTitle: true,
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
