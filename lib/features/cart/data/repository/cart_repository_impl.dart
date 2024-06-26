import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/extensions/firestore_extension.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';

import '../../../../core/constants/firestore_collection.dart';
import '../../domain/repository/cart_repository.dart';

@Injectable(as: ICartRepository)
class CartRepositoryImpl implements ICartRepository {
  final FirebaseFirestore db;
  CartRepositoryImpl(this.db);

  @override
  Future<bool> addToCart(AddToCartRequestModel request) async {
    try {
      await db.collection(FirestoreCollection.carts).add(request.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteCartItem(String cartId) async {
    try {
      await db.collection(FirestoreCollection.carts).doc(cartId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<BaseResponseList<CartModel>> getCartItems(String userId) async {
    final response = await db
        .collection(FirestoreCollection.carts)
        .where("userId", isEqualTo: userId)
        .get();
    return response.toApiResponseList(fromDoc: CartModel.fromFirestore);
  }

  @override
  Future<bool> updateCartItem(String cartId, int quantity) async {
    try {
      await db
          .collection(FirestoreCollection.carts)
          .doc(cartId)
          .update({"quantity": quantity});
      return true;
    } catch (e) {
      return false;
    }
  }
}
