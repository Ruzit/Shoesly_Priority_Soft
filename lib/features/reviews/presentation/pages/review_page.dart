import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_priority_soft/core/enum/review_score_filter.dart';
import 'package:shoesly_priority_soft/core/injection/injection.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_filter.dart';
import 'package:shoesly_priority_soft/features/reviews/presentation/bloc/review_bloc.dart';
import 'package:shoesly_priority_soft/features/reviews/presentation/widgets/review_tile.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';

@RoutePage(name: 'ReviewPageRouter')
class ReviewPage extends StatefulWidget {
  final ProductModel product;
  const ReviewPage({super.key, required this.product});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final reviewBloc = getIt<ReviewBloc>();

  ReviewScoreFilter selectedFilter = ReviewScoreFilter.all;

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Review (${widget.product.totalReviews})',
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
      body: BlocProvider(
        create: (context) => reviewBloc
          ..add(
            ReviewEvent.getProductReviews(
              productId: widget.product.id!,
              filter: ReviewFilter(count: 20),
            ),
          ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ReviewScoreFilter.values
                    .map((value) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedFilter = value;
                              });
                              reviewBloc.add(
                                ReviewEvent.getProductReviews(
                                  productId: widget.product.id!,
                                  filter: ReviewFilter(
                                    count: 100,
                                    scoreFilter: value,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              value.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: selectedFilter == value
                                        ? blackColor
                                        : productTileColor,
                                  ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    success: (reviews) {
                      return ListView.separated(
                        itemCount: reviews.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        itemBuilder: (context, index) => ReviewTile(
                          review: reviews[index],
                        ),
                        separatorBuilder: (context, index) =>
                            verticalSpace(space: 24.0),
                      );
                    });
              },
            ).expanded(),
          ],
        ),
      ),
    );
  }
}
