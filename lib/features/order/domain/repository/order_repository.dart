import 'package:shoesly_priority_soft/core/model/base_response.dart';

import '../../data/models/add_order_request.dart';

abstract class IOrderRepository {
  Future<BaseResponse<void>> addOrder({required AddOrderRequest order});
}
