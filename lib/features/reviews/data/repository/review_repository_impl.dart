import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_filter.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';

import '../../domain/repository/review_repository.dart';

@Injectable(as: IReviewRepository)
class ReviewRepositoryImpl implements IReviewRepository {
  @override
  Future<BaseResponseList<ReviewModel>> getProductReviews(
      {required String productId, required ReviewFilter filter}) {
    // TODO: implement getProductReviews
    throw UnimplementedError();
  }
}
