import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part "review_model.g.dart";

@JsonSerializable()
class ReviewModel {
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? id;
  final String productId;
  final String userName;
  final String userImage;
  final String content;
  final num reviewScore;
  final DateTime createdAt;

  ReviewModel(
      {this.id,
      required this.productId,
      required this.userName,
      required this.userImage,
      required this.content,
      required this.reviewScore,
      required this.createdAt});

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  factory ReviewModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final r = ReviewModel.fromJson(doc.data());
    r.id = doc.id;
    return r;
  }
}
