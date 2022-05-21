import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> images = [
    "assets/images/offres/Offer1.jpg",
    "assets/images/offres/Offer2.jpg",
    "assets/images/offres/Offer3.jpg",
    "assets/images/offres/Offer4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (context, index) {
          final image = images[index];
          return Image.asset(
            image,
            fit: BoxFit.fill,
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
