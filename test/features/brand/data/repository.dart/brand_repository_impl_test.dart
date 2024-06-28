// import 'dart:convert';

// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:shoesly_priority_soft/core/constants/firestore_collection.dart';
// import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';
// import 'package:shoesly_priority_soft/features/brand/data/repository/brand_repository_impl.dart';

// import '../../../../fixtures/fixture_reader.dart';

// void main() {
//   late FakeFirebaseFirestore mockFirebaseFirestore;
//   late BrandRepositoryImpl brandRepositoryImpl;

//   setUp(() {
//     mockFirebaseFirestore = FakeFirebaseFirestore();
//     brandRepositoryImpl = BrandRepositoryImpl(
//       mockFirebaseFirestore,
//     );
//   });

//   final tBrandModel = BrandModel(
//     id: "a48e4df0-145d-104f-aff0-6f88962d8579",
//     name: 'Nike',
//     logo:
//         'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187',
//     totalProducts: 88,
//   );

//   const Map<String, dynamic> data = {'answer': 42};

//   group('getLatestNews', () {
//     final tBrandModel =
//         BrandModel.fromJson(jsonDecode(fixtures('brand_model.json')));

//     test('should return News Model', () async {
//       //arrange
//       when(mockFirebaseFirestore.collection(FirestoreCollection.brands).get());
//       //act
//       brandRepositoryImpl.getBrandList();
//       //assert
//       verify(
//           mockFirebaseFirestore.collection(FirestoreCollection.brands).get());
//     });
//   });

//   test('getFromCollection gets data from a given collection', () async {
//     final FirestoreService firestoreService =
//         FirestoreService(firestore: fakeFirebaseFirestore!);
//     const String collectionPath = 'collectionPath';

//     await fakeFirebaseFirestore!.collection(collectionPath).add(data);

//     final List<Map<String, dynamic>> dataList = (await firestoreService
//             .getFromCollection(collectionPath: collectionPath))
//         .docs
//         .map((e) => e.data())
//         .toList();

//     expect(dataList, const MapListContains(data));
//   });
// }

// class MapListContains extends Matcher {
//   final Map<dynamic, dynamic> _expected;

//   const MapListContains(this._expected);

//   @override
//   Description describe(Description description) {
//     return description.add('contains ').addDescriptionOf(_expected);
//   }

//   @override
//   bool matches(dynamic item, Map matchState) {
//     if (item is List<Map>) {
//       return item.any((element) => mapEquals(element, _expected));
//     }
//     return false;
//   }
// }
