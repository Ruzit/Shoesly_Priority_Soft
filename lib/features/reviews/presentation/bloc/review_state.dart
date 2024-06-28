part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.error({required String errorMsg}) = _Error;
  const factory ReviewState.success({required List<ReviewModel> reviewList}) =
      _Success;
}
