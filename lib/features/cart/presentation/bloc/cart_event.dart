part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.addToCart(AddToCartRequestModel request) = _AddToCart;
  const factory CartEvent.deleteCartItem(String itemId) = _DeleteCartItems;
  const factory CartEvent.updateCartItem(String itemId, int quantity) =
      _UpdateCartItems;
  const factory CartEvent.getCartItems(String userId) = _GetCartItems;
}
