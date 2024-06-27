import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final String description;
  const ProductDescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpace(space: 4.0),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                color: colorDarkGrey,
              ),
        ),
      ],
    );
  }
}
