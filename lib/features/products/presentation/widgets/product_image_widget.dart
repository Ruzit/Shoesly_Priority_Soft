import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_color_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../gen/assets.gen.dart';

class ProductImageWidget extends StatefulWidget {
  const ProductImageWidget({super.key});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.red,
  ];

  Color? selectedColor;

  @override
  void initState() {
    selectedColor = colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      height: MediaQuery.of(context).size.width - 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: colorLightGrey,
      ),
      child: Column(
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedColor ?? Colors.transparent,
                BlendMode.modulate,
              ),
              child: Assets.images.jordan1.image().padding(all: 16),
            ),
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) => setState(() {
                _current = index;
              }),
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
          ).expanded(),
          verticalSpace(space: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DotsIndicator(
                dotsCount: 3,
                position: _current,
                decorator: const DotsDecorator(
                  shape: CircleBorder(),
                  activeShape: CircleBorder(),
                  size: Size(8, 8),
                  color: productTileColor,
                  activeColor: blackColor,
                ),
              ),
              ProductColorPicker(
                colors: colors,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                selectedColor: selectedColor,
              ),
            ],
          ).padding(right: 12, left: 16, bottom: 16)
        ],
      ),
    );
  }
}
