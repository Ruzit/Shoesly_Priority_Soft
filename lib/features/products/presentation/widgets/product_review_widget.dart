import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/widgets/app_button.dart';

import '../../../../core/utils/spacing_utils.dart';
import '../../../../core/widgets/app_rating_bar.dart';
import '../../../../gen/assets.gen.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({super.key});

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
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        verticalSpace(space: 4.0),
        ListView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: Assets.images.jordan3.provider(),
              ),
              title: Text(
                'John Doe',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppRatingBar(
                    initialRating: 4,
                    maxRating: 5,
                    size: 12,
                  ),
                  verticalSpace(space: 8),
                  Text(
                    'Perfect for keeping your feet dry and warm in damp conditions.',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
          },
        ),
        AppButton(
          buttonText: 'SEE ALL REVIEW',
          fontStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xffffffff),
          borderColor: borderColor,
          onPressed: () {},
        )
      ],
    );
  }
}
