import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/products/domain/usecases/get_product_list.dart';

import '../../data/models/product_filter.dart';
import '../../data/models/product_model.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductList _productList;
  ProductBloc(this._productList) : super(const _Initial()) {
    on<ProductEvent>((event, emit) async {
      await event.whenOrNull(
        getProductList: (filter) async {
          emit(const ProductState.loading());
          final response = await _productList(filter: filter);
          if (response.success) {
            emit(ProductState.success(productList: response.data!));
          } else {
            emit(ProductState.error(errorMsg: response.message));
          }
        },
      );
    });
  }
}
