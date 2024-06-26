import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/order/data/models/add_order_request.dart';

import '../../../../core/constants/firestore_collection.dart';
import '../../domain/repository/order_repository.dart';

@Injectable(as: IOrderRepository)
class OrderRepositoryImpl implements IOrderRepository {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  OrderRepositoryImpl(this.db, this.auth);

  @override
  Future<BaseResponse<void>> addOrder({required AddOrderRequest order}) async {
    final data = order.toJson();
    //add created at time to order
    data["createdAt"] = FieldValue.serverTimestamp();
    //make order for current user
    data["userId"] = auth.currentUser!.uid;

    await db.collection(FirestoreCollection.orders).add(data);

    //remove cart items
    await Future.wait(order.items.map(
        (e) => db.collection(FirestoreCollection.carts).doc(e.id).delete()));

    return BaseResponse(
        success: true, message: "Order Placed Successfully", data: null);
  }
}
