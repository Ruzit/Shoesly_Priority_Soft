import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({super.key});

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
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        verticalSpace(space: 4.0),
        ListView.builder(
          itemBuilder: (context, index) => Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: 1.0,
              ),
            ),
            child: Text(
              '40.5',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorDarkGrey,
                  ),
            ),
          ),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
        ).height(50),
      ],
    );
  }
}
