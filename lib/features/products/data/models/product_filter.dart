import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';

import '../../../../core/enum/gender.dart';
import '../../../../core/enum/product_color.dart';
import '../../../../core/enum/product_sort.dart';

class ProductFilter {
  BrandModel? brand;
  PriceRange? priceRange;
  ProductSort? sortBy;
  Gender? gender;
  ProductColor? color;
  int limit;

  ProductFilter({
    this.brand,
    this.priceRange,
    this.sortBy,
    this.gender,
    this.color,
    required this.limit,
  });

  int get appliedCount {
    int count = 0;
    for (var field in [brand, priceRange, sortBy, gender, color]) {
      if (field != null) {
        count++;
      }
    }
    return count;
  }

  static int perPage = 10;
}

class PriceRange {
  final double? min;
  final double? max;
  const PriceRange({required this.min, required this.max});
}
