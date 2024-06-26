// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      productColor:
          $enumDecodeNullable(_$ProductColorEnumMap, json['productColor']),
      size: json['size'] as num?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'product': instance.product.toJson(),
      'size': instance.size,
      'productColor': _$ProductColorEnumMap[instance.productColor],
      'userId': instance.userId,
      'quantity': instance.quantity,
    };

const _$ProductColorEnumMap = {
  ProductColor.white: 'white',
  ProductColor.black: 'black',
  ProductColor.red: 'red',
};
