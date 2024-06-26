import 'package:shoesly_priority_soft/features/order/domain/repository/order_repository.dart';

import '../../../../core/model/base_response.dart';
import '../../data/models/add_order_request.dart';

class AddOrder {
  final IOrderRepository _orderRepository;

  const AddOrder(this._orderRepository);

  Future<BaseResponse<void>> call({required AddOrderRequest order}) {
    return _orderRepository.addOrder(order: order);
  }
}
