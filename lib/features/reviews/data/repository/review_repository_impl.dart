import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/enum/review_score_filter.dart';
import 'package:shoesly_priority_soft/core/extensions/firestore_extension.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_filter.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';

import '../../../../core/constants/firestore_collection.dart';
import '../../domain/repository/review_repository.dart';

@Injectable(as: IReviewRepository)
class ReviewRepositoryImpl implements IReviewRepository {
  final FirebaseFirestore db;

  ReviewRepositoryImpl(this.db);
  @override
  Future<BaseResponseList<ReviewModel>> getProductReviews(
      {required String productId, required ReviewFilter filter}) async {
    var query = db
        .collection(FirestoreCollection.reviews)
        .where("productId", isEqualTo: productId)
        .limit(filter.count)
        .orderBy("reviewScore", descending: true);
    if (filter.scoreFilter != null) {
      query = query.where("reviewScore", isEqualTo: filter.scoreFilter!.value);
    }
    final response = await query.get();
    return response.toApiResponseList(fromDoc: ReviewModel.fromFirestore);
  }
}
