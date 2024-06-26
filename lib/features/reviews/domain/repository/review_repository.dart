import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';

import '../../data/models/review_filter.dart';

abstract class IReviewRepository {
  Future<BaseResponseList<ReviewModel>> getProductReviews(
      {required String productId, required ReviewFilter filter});
}
