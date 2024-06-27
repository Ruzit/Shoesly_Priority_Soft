import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/brand/domain/usecases/get_brand_list.dart';
import 'package:shoesly_priority_soft/features/brand/domain/usecases/get_specific_brand.dart';

import '../../data/models/brand_model.dart';

part 'brand_bloc.freezed.dart';
part 'brand_event.dart';
part 'brand_state.dart';

@injectable
class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final GetBrandList _getBrandList;
  final GetSpecificBrand _getSpecificBrand;
  BrandBloc(this._getBrandList, this._getSpecificBrand)
      : super(const _Initial()) {
    on<BrandEvent>((event, emit) async {
      await event.whenOrNull(
        getBrandList: () async {
          emit(const BrandState.loading());
          final response = await _getBrandList();
          if (response.success) {
            emit(BrandState.success(brandList: response.data!));
          } else {
            emit(BrandState.error(errorMsg: response.message));
          }
        },
        getSpecificBrand: (brandName) async {
          emit(const BrandState.loading());
          final response = await _getSpecificBrand(brandName: brandName);
          if (response.success) {
            emit(BrandState.getSpecificBrandsuccess(brand: response.data!));
          } else {
            emit(BrandState.error(errorMsg: response.message));
          }
        },
      );
    });
  }
}
