import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../core/widgets/app_rating_bar.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Jordan 1 Retro High Tie Dye',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        verticalSpace(space: 6.0),
        Row(
          children: [
            const AppRatingBar(
              size: 16,
              initialRating: 4,
              maxRating: 5,
            ),
            horizontalSpace(space: 8),
            Text(
              "4.5",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 04,
            ),
            Text(
              "(1023 Reviews)",
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
