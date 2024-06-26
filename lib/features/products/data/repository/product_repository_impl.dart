import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/core/extensions/firestore_extension.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_filter.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';

import '../../../../core/constants/firestore_collection.dart';
import '../../../../core/enum/product_color.dart';
import '../../../../core/enum/product_sort.dart';
import '../../domain/repository/product_repository.dart';

@Injectable(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  final FirebaseFirestore db;

  ProductRepositoryImpl(this.db);
  @override
  Future<BaseResponseList<ProductModel>> getProductList(
      {required ProductFilter filter}) async {
    Query<Map<String, dynamic>> query =
        db.collection(FirestoreCollection.products).limit(filter.limit);
    //There will be losts of filter if we filter each field in different query
    //to solve this problem even user havenot apply for field the default filter  will be applied and a index for every field already been created
    //this way we can reduce numbe of indexes required in firestore

    if (filter.brand != null) {
      query = query.where("brand", isEqualTo: filter.brand!.name);
    } else {
      query = query.where("brand", isNotEqualTo: null);
    }
    if (filter.color != null) {
      query = query.where("colors", arrayContainsAny: [filter.color!.name]);
    } else {
      query = query.where("colors",
          arrayContainsAny: ProductColor.values.map((e) => e.name).toList());
    }
    if (filter.gender != null) {
      query = query.where("gender", isEqualTo: filter.gender!.name);
    } else {
      query = query.where("gender", isNotEqualTo: null);
    }
    if (filter.sortBy != null) {
      switch (filter.sortBy!) {
        case ProductSort.priceLowToHigh:
          query = query.orderBy("price", descending: false);
          break;
        case ProductSort.priceHighToLow:
          query = query.orderBy("price", descending: true);
          break;
        case ProductSort.recent:
          query = query.orderBy("avgRating", descending: true);
          break;
        default:
          break;
      }
    }
    // query = query
    //     .where("price", isGreaterThanOrEqualTo: filter.priceRange?.min ?? 0)
    //     .where("price", isLessThanOrEqualTo: filter.priceRange?.max ?? 10000);
    final response = await query.get();
    return response.toApiResponseList(fromDoc: ProductModel.fromFirestore);
  }
}
