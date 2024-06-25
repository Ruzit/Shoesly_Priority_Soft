import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/widgets/app_rating_bar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/utils/spacing_utils.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CircleAvatar(
          radius: 24,
        ),
        horizontalSpace(space: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'John Doe',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Today',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: productTileColor),
                ),
              ],
            ),
            verticalSpace(space: 4.0),
            const AppRatingBar(
              initialRating: 4,
              maxRating: 5,
            ),
            verticalSpace(space: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ).expanded(),
      ],
    ).width(MediaQuery.of(context).size.width);
  }
}
