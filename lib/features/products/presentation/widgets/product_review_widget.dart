import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/widgets/app_button.dart';
import 'package:shoesly_priority_soft/features/reviews/presentation/widgets/review_tile.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/spacing_utils.dart';

class ProductTopReviewsWidget extends StatelessWidget {
  const ProductTopReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Reviews (1045)',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpace(space: 12.0),
        ListView.separated(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => const ReviewTile(),
          separatorBuilder: (context, index) => verticalSpace(space: 16.0),
        ),
        AppButton(
          buttonText: 'SEE ALL REVIEW',
          fontStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xffffffff),
          borderColor: borderColor,
          onPressed: () => context.router.push(const ReviewPageRouter()),
        )
      ],
    );
  }
}
