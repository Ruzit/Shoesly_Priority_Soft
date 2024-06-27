import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/extensions/firestore_extension.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';

import '../../../../core/constants/firestore_collection.dart';
import '../../domain/repository/brand_repository.dart';

@Injectable(as: IBrandRepository)
class BrandRepositoryImpl implements IBrandRepository {
  final FirebaseFirestore db;
  BrandRepositoryImpl(this.db);

  @override
  Future<BaseResponseList<BrandModel>> getBrandList() async {
    final response = await db.collection(FirestoreCollection.brands).get();
    return response.toApiResponseList(fromDoc: BrandModel.fromFirestore);
  }

  @override
  Future<BaseResponse<BrandModel>> getSpecificBrand(
      {required String brandName}) async {
    Query<Map<String, dynamic>> query = db
        .collection(FirestoreCollection.brands)
        .where("name", isEqualTo: brandName);
    final response = await query.get();

    return BaseResponse(
      success: true,
      message: "",
      data: BrandModel.fromFirestore(response.docs.first),
    );
  }
}
