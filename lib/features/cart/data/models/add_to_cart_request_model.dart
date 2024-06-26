import 'package:json_annotation/json_annotation.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';

import '../../../../core/enum/product_color.dart';

part "add_to_cart_request_model.g.dart";

@JsonSerializable(createFactory: false, explicitToJson: true)
class AddToCartRequestModel {
  final ProductModel product;
  final num? size;
  final ProductColor? productColor;
  String? userId;
  final int quantity;
  AddToCartRequestModel({
    required this.product,
    this.userId,
    required this.quantity,
    required this.productColor,
    required this.size,
  });

//convert the model to json(map in dart)
  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);
}
