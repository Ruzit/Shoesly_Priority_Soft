import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/enum/gender.dart';
import '../../../../core/enum/product_color.dart';

part "product_model.g.dart";

@JsonSerializable(explicitToJson: true)
class ProductModel {
  @JsonKey(includeToJson: true)
  String? id;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final String brand;
  final num avgRating;
  final int totalReviews;
  final List<num> sizes;
  final List<ProductColor> colors;
  final Gender gender;
  DateTime? createdAt;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.brand,
    required this.avgRating,
    required this.totalReviews,
    required this.sizes,
    required this.colors,
    required this.thumbnail,
    required this.gender,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final p = ProductModel.fromJson(doc.data());
    p.id = doc.id;
    return p;
  }
}
