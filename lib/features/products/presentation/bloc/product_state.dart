part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.error({required String errorMsg}) = _Error;
  const factory ProductState.success(
      {required List<ProductModel> productList}) = _Success;
}
