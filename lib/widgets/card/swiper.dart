import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SwiperImage extends StatefulWidget {
  const SwiperImage({super.key});

  @override
  State<SwiperImage> createState() => _SwiperImageState();
}

class _SwiperImageState extends State<SwiperImage> {
  int? imageValue;
  final List urlImages = [
    {"id": 1, 'image_path': "assets/slider/foto1.png"},
    {"id": 2, 'image_path': "assets/slider/foto2.png"},
    {"id": 3, 'image_path': "assets/slider/foto5.png"},
    {"id": 4, 'image_path': "assets/slider/foto6.png"},
    {"id": 5, 'image_path': "assets/slider/foto7.png"},
    {"id": 6, 'image_path': "assets/slider/foto8.png"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: CarouselSlider(
                    items: urlImages
                        .map((item) => Container(
                      margin: const EdgeInsets.only(
                        left: 5,
                        top: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            item['image_path'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                  )
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // SliderPositioned(
        //   imageList: urlImages,
        //   carouselController: carouselController,
        //   currentIndex: currentIndex,
        // ),
      ],
    );
  }
}
