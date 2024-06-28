import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductSizeWidget extends StatelessWidget {
  final List<double> sizes;
  final double? selectedSize;
  final Function(double) onSizeSelect;
  const ProductSizeWidget(
      {super.key,
      required this.sizes,
      this.selectedSize,
      required this.onSizeSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Size',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpace(space: 4.0),
        ListView.separated(
          separatorBuilder: (context, index) => horizontalSpace(space: 12.0),
          itemBuilder: (context, index) => InkWell(
            onTap: () => onSizeSelect(sizes[index]),
            customBorder: const CircleBorder(),
            child: Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      selectedSize == sizes[index] ? blackColor : borderColor,
                  width: 1.0,
                ),
                color: selectedSize == sizes[index] ? blackColor : null,
              ),
              child: Text(
                '${sizes[index]}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: selectedSize == sizes[index]
                          ? Colors.white
                          : colorDarkGrey,
                    ),
              ),
            ),
          ),
          itemCount: sizes.length,
          scrollDirection: Axis.horizontal,
        ).height(50),
      ],
    );
  }
}
