import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';

import '../../../../core/enum/product_color.dart';

part "cart_model.g.dart";

@JsonSerializable(explicitToJson: true)
class CartModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? id;
  final ProductModel product;
  final num? size;
  final ProductColor? productColor;
  final String userId;
  final int quantity;
  CartModel({
    required this.product,
    required this.userId,
    required this.quantity,
    required this.productColor,
    required this.size,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  factory CartModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final c = CartModel.fromJson(doc.data());
    c.id = doc.id;
    return c;
  }

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
