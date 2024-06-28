// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      logo: json['logo'] as String,
      totalProducts: (json['totalProducts'] as num).toInt(),
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'totalProducts': instance.totalProducts,
    };
