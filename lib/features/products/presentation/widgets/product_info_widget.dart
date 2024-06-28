import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../core/widgets/app_rating_bar.dart';

class ProductInfoWidget extends StatelessWidget {
  final String name;
  final int avgRating;
  final int totalReviews;
  const ProductInfoWidget(
      {super.key,
      required this.name,
      required this.avgRating,
      required this.totalReviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        verticalSpace(space: 6.0),
        Row(
          children: [
            AppRatingBar(
              size: 16,
              initialRating: avgRating.toDouble(),
              maxRating: 5,
            ),
            horizontalSpace(space: 8),
            Text(
              "$avgRating.0",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 04,
            ),
            Text(
              "($totalReviews Reviews)",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: productTileColor),
            )
          ],
        ),
      ],
    );
  }
}
