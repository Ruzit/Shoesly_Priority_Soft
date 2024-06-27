import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';

extension CartExtension on List<CartModel> {
  double get total => fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quantity);
}
