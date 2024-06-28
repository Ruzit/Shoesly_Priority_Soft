part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.error({required String errorMsg}) = _Error;
  const factory CartState.getCartItemssuccess(
      {required List<CartModel> cartItems}) = _GetCartItemsSuccess;
  const factory CartState.success(String message) = _Success;
  const factory CartState.addToCartsuccess(String message) = _AddToSuccess;
}
