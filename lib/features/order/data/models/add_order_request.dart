import 'package:json_annotation/json_annotation.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';

import '../../../../core/enum/payment_method.dart';

part "add_order_request.g.dart";

@JsonSerializable(explicitToJson: true)
class AddOrderRequest {
  final List<CartModel> items;
  final double subTotal;
  final double shippingFee;
  final double total;
  final PaymentMethod paymentMethod;
  final ShippingAddress? shippingAddress;

  AddOrderRequest(
      {required this.paymentMethod,
      required this.items,
      required this.subTotal,
      required this.shippingFee,
      required this.total,
      required this.shippingAddress});
  factory AddOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$AddOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShippingAddress {
  final String address;

  ShippingAddress({required this.address});
  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
