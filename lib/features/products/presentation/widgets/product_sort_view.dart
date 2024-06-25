import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/enum/product_sort.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductSortView extends StatelessWidget {
  final ProductSort? productSort;
  const ProductSortView({super.key, this.productSort});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort By',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ).padding(horizontal: 24),
        verticalSpace(space: 12.0),
        ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: ProductSort.values.map((e) {
            var isSelected = productSort != null && productSort == e;
            return Text(
              e.value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            )
                .padding(horizontal: 24)
                .alignment(Alignment.center)
                .decorated(
                  borderRadius: BorderRadius.circular(40),
                  color: isSelected ? blackColor : null,
                  border: isSelected ? null : Border.all(color: colorBorder),
                )
                .padding(horizontal: 8);
          }).toList(),
        ).height(45),
      ],
    );
  }
}
