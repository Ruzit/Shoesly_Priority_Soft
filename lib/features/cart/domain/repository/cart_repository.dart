import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';

import '../../data/models/add_to_cart_request_model.dart';

abstract class ICartRepository {
  Future<BaseResponseList<CartModel>> getCartItems(String userId);

  Future<bool> addToCart(AddToCartRequestModel request);

  Future<bool> deleteCartItem(String cartId);

  Future<bool> updateCartItem(String cartId, int quantity);
}
