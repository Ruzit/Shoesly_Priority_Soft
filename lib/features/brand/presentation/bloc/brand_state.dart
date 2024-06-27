part of 'brand_bloc.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState.initial() = _Initial;
  const factory BrandState.loading() = _Loading;
  const factory BrandState.error({required String errorMsg}) = _Error;
  const factory BrandState.success({required List<BrandModel> brandList}) =
      _Success;
  const factory BrandState.getSpecificBrandsuccess(
      {required BrandModel brand}) = _GetSpecificBrandSuccess;
}
