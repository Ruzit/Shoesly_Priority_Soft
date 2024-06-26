import '../../../../core/model/base_response.dart';
import '../../data/models/review_filter.dart';
import '../../data/models/review_model.dart';
import '../repository/review_repository.dart';

class GetProductReviews {
  final IReviewRepository _reviewRepository;

  const GetProductReviews(this._reviewRepository);

  Future<BaseResponseList<ReviewModel>> call(
          {required String productId, required ReviewFilter filter}) =>
      _reviewRepository.getProductReviews(productId: productId, filter: filter);
}
