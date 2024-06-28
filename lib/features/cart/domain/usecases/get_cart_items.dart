import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/cart/domain/repository/cart_repository.dart';

import '../../../../core/model/base_response.dart';
import '../../data/models/cart_model.dart';

@injectable
class GetCartItems {
  final ICartRepository _cartRepository;

  const GetCartItems(this._cartRepository);

  Future<BaseResponseList<CartModel>> call(String userId) {
    return _cartRepository.getCartItems(userId);
  }
}
