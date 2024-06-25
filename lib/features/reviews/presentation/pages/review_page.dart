import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/reviews/presentation/widgets/review_tile.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';

@RoutePage(name: 'ReviewPageRouter')
class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Review (1045)',
      centerTitle: true,
      actions: [
        Row(
          children: [
            Assets.icons.star.svg(height: 16, width: 16),
            horizontalSpace(space: 4.0),
            Text(
              '4.5',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ).padding(right: 24)
      ],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Item',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: productTileColor,
                        ),
                  ),
                );
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          ListView.separated(
            itemCount: 12,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            itemBuilder: (context, index) => const ReviewTile(),
            separatorBuilder: (context, index) => verticalSpace(space: 24.0),
          ).expanded(),
        ],
      ),
    );
  }
}
