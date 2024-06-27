import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';

abstract class IBrandRepository {
  Future<BaseResponseList<BrandModel>> getBrandList();
  Future<BaseResponse<BrandModel>> getSpecificBrand(
      {required String brandName});
}
