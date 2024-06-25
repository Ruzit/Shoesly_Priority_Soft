import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

class BrandFilterView extends StatelessWidget {
  const BrandFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brands',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ).padding(horizontal: 24),
        verticalSpace(space: 12.0),
        ListView.separated(
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          separatorBuilder: (context, index) => horizontalSpace(space: 32.0),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: colorLightGrey,
                  radius: 30,
                  child: Assets.icons.nike.svg(),
                ),
                verticalSpace(space: 8.0),
                Text(
                  'NIKE',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '123 Items',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontSize: 11, color: productTileColor),
                ),
              ],
            );
          },
        ).height(110),
      ],
    );
  }
}
