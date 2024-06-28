import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/base_response.dart';

extension FirestoreExtension on QuerySnapshot<Map<String, dynamic>> {
  BaseResponseList<T> toApiResponseList<T>(
      {required T Function(QueryDocumentSnapshot<Map<String, dynamic>>)
          fromDoc}) {
    try {
      final docs = this.docs;
      final data = docs.map((doc) => fromDoc(doc)).toList();
      return BaseResponse(success: true, message: "", data: data);
    } catch (e) {
      return BaseResponse(success: false, message: "$e", data: null);
    }
  }
}
