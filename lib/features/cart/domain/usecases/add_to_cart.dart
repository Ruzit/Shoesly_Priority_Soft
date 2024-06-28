import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/cart/domain/repository/cart_repository.dart';

import '../../data/models/add_to_cart_request_model.dart';

@injectable
class AddToCart {
  final ICartRepository _cartRepository;

  const AddToCart(this._cartRepository);

  Future<bool> call(AddToCartRequestModel request) {
    return _cartRepository.addToCart(request);
  }
}
