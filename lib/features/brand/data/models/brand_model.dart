import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  String? id;
  final String name;
  final String logo;
  final int totalProducts;
  BrandModel({
    this.id,
    required this.name,
    required this.logo,
    required this.totalProducts,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
  factory BrandModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final brand = BrandModel.fromJson(doc.data());
    brand.id = doc.id;
    return brand;
  }
}
