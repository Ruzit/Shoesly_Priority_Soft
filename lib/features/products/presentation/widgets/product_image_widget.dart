import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/widgets/app_network_image.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_color_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/enum/product_color.dart';
import '../../../../core/utils/spacing_utils.dart';

class ProductImageWidget extends StatefulWidget {
  final List<String> images;
  final List<ProductColor> colors;
  final ProductColor selectedColor;
  final Function(ProductColor) onColorSelect;
  const ProductImageWidget({
    super.key,
    required this.images,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelect,
  });

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) => ColorFiltered(
              colorFilter: ColorFilter.mode(
                widget.selectedColor.value,
                BlendMode.modulate,
              ),
              child:
                  AppNetworkImage(url: widget.images[index]).padding(all: 16),
            ),
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) => setState(() {
                _current = index;
              }),
              // autoPlay: true,
            ),
          ).expanded(),
          verticalSpace(space: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DotsIndicator(
                dotsCount: widget.images.length,
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
                colors: widget.colors,
                onColorSelected: widget.onColorSelect,
                selectedColor: widget.selectedColor,
              ),
            ],
          ).padding(right: 12, left: 16, bottom: 16)
        ],
      ),
    );
  }
}
