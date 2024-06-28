import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/enum/product_color.dart';

class ProductColorPicker extends StatefulWidget {
  final List<ProductColor> colors;
  final ProductColor selectedColor;
  final void Function(ProductColor) onColorSelected;
  const ProductColorPicker({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: widget.colors.map((color) {
          return InkWell(
            onTap: () {
              widget.onColorSelected(color);
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: color.value,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: 1,
                        )),
                  ),
                  if (widget.selectedColor.value == color.value)
                    Icon(
                      Icons.check,
                      size: 13,
                      color: color.value == Colors.white
                          ? Colors.black
                          : Colors.white,
                    )
                ],
              ),
            ),
          ).padding(horizontal: 3);
        }).toList(),
      ),
    );
  }
}
