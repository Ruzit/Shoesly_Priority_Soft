import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';
import 'package:shoesly_priority_soft/features/reviews/domain/usecases/get_product_reviews.dart';

import '../../data/models/review_filter.dart';

part 'review_bloc.freezed.dart';
part 'review_event.dart';
part 'review_state.dart';

@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final GetProductReviews _getProductReviews;
  ReviewBloc(this._getProductReviews) : super(const _Initial()) {
    on<ReviewEvent>((event, emit) async {
      await event.whenOrNull(
        getProductReviews: (productId, filter) async {
          emit(const ReviewState.loading());
          final response =
              await _getProductReviews(productId: productId, filter: filter);
          if (response.success) {
            emit(ReviewState.success(reviewList: response.data!));
          } else {
            emit(ReviewState.error(errorMsg: response.message));
          }
        },
      );
    });
  }
}
