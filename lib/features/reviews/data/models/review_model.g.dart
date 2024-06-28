// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      productId: json['productId'] as String,
      userName: json['userName'] as String,
      userImage: json['userImage'] as String,
      content: json['content'] as String,
      reviewScore: json['reviewScore'] as num,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'content': instance.content,
      'reviewScore': instance.reviewScore,
      'createdAt': instance.createdAt.toIso8601String(),
    };
