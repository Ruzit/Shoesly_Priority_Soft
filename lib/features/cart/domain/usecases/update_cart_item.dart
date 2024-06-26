import 'package:shoesly_priority_soft/features/cart/domain/repository/cart_repository.dart';

class UpdateCartItem {
  final ICartRepository _cartRepository;

  const UpdateCartItem(this._cartRepository);

  Future<bool> call(String itemId, int quantity) {
    return _cartRepository.updateCartItem(itemId, quantity);
  }
}
