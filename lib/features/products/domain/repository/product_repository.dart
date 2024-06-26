import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';

import '../../../../core/model/base_response.dart';
import '../../data/models/product_filter.dart';

abstract class IProductRepository {
  Future<BaseResponseList<ProductModel>> getProductList(
      {required ProductFilter filter});
}
