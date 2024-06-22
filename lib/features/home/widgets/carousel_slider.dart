import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        initialPage: 0,
        pauseAutoPlayOnManualNavigate: true,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 310,
              height: 180,
              decoration:
                  const BoxDecoration(color: ConstantColors.appMainColor),
            );
          },
        );
      }).toList(),
    );
  }
}
