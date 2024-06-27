import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/widgets/app_button.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_filter.dart';
import 'package:shoesly_priority_soft/features/reviews/presentation/widgets/review_tile.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../reviews/presentation/bloc/review_bloc.dart';

class ProductTopReviewsWidget extends StatefulWidget {
  final int totalReviews;
  final String productId;

  const ProductTopReviewsWidget(
      {super.key, required this.totalReviews, required this.productId});

  @override
  State<ProductTopReviewsWidget> createState() =>
      _ProductTopReviewsWidgetState();
}

class _ProductTopReviewsWidgetState extends State<ProductTopReviewsWidget> {
  final ReviewBloc reviewBloc = getIt<ReviewBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reviewBloc
        ..add(
          ReviewEvent.getProductReviews(
            productId: widget.productId,
            filter: ReviewFilter(count: 3),
          ),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Reviews (${widget.totalReviews})',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          verticalSpace(space: 12.0),
          BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),
                success: (reviews) {
                  return ListView.separated(
                    itemCount: reviews.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ReviewTile(
                      review: reviews[index],
                    ),
                    separatorBuilder: (context, index) =>
                        verticalSpace(space: 16.0),
                  );
                },
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
            onPressed: () => context.router.push(ReviewPageRouter(
              productId: widget.productId,
            )),
          )
        ],
      ),
    );
  }
}
