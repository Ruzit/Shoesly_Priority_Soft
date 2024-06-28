import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/extensions/date_extension.dart';
import 'package:shoesly_priority_soft/core/widgets/app_rating_bar.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/utils/spacing_utils.dart';

class ReviewTile extends StatelessWidget {
  final ReviewModel review;
  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 24,
          backgroundImage: CachedNetworkImageProvider(review.userImage),
        ),
        horizontalSpace(space: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  review.userName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  review.createdAt.timeAgo(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: productTileColor),
                ),
              ],
            ),
            verticalSpace(space: 4.0),
            AppRatingBar(
              initialRating: review.reviewScore.toDouble(),
              maxRating: 5,
            ),
            verticalSpace(space: 8.0),
            Text(
              review.content,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ).expanded(),
      ],
    ).width(MediaQuery.of(context).size.width);
  }
}
