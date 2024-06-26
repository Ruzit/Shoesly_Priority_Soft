import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_filter.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';
import 'package:shoesly_priority_soft/features/products/domain/repository/product_repository.dart';

import '../../../../core/model/base_response.dart';

@injectable
class GetProductList {
  final IProductRepository _productRepository;

  const GetProductList(this._productRepository);

  Future<BaseResponseList<ProductModel>> call({required ProductFilter filter}) {
    return _productRepository.getProductList(filter: filter);
  }
}
