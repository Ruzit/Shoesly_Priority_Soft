part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.started() = _Started;
  const factory ReviewEvent.getProductReviews({
    required String productId,
    required ReviewFilter filter,
  }) = _GetProductReviews;
}
