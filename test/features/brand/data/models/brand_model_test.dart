import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tBrandModel = BrandModel(
    id: "a48e4df0-145d-104f-aff0-6f88962d8579",
    name: 'Nike',
    logo:
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187',
    totalProducts: 88,
  );

  group('fromJson', () {
    test('should return valid model from JSON', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtures('brand_model.json'));
      //act
      final result = BrandModel.fromJson(jsonMap);
      //assert
      expect(result, tBrandModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      //act
      final result = tBrandModel.toJson();
      //assert
      final expectedMap = {
        "id": "a48e4df0-145d-104f-aff0-6f88962d8579",
        "name": "Nike",
        "totalProducts": 88,
        "logo":
            "https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187"
      };
      expect(result, expectedMap);
    });
  });
}
