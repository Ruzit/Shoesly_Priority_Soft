import 'package:shoesly_priority_soft/features/cart/domain/repository/cart_repository.dart';

class DeleteCartItem {
  final ICartRepository _cartRepository;

  const DeleteCartItem(this._cartRepository);

  Future<bool> call(String itemId) {
    return _cartRepository.deleteCartItem(itemId);
  }
}
