import '../../../../core/model/base_response.dart';
import '../../data/models/brand_model.dart';
import '../repository/brand_repository.dart';

class GetBrandList {
  final IBrandRepository _brandRepository;

  const GetBrandList(this._brandRepository);

  Future<BaseResponseList<BrandModel>> call() {
    return _brandRepository.getBrandList();
  }
}
