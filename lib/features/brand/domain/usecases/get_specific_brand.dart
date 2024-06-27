import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';

import '../../data/models/brand_model.dart';
import '../repository/brand_repository.dart';

@injectable
class GetSpecificBrand {
  final IBrandRepository _brandRepository;

  const GetSpecificBrand(this._brandRepository);

  Future<BaseResponse<BrandModel>> call({required String brandName}) {
    return _brandRepository.getSpecificBrand(brandName: brandName);
  }
}
