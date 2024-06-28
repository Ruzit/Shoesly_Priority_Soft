import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';
import 'package:shoesly_priority_soft/features/brand/domain/usecases/get_brand_list.dart';
import 'package:shoesly_priority_soft/features/brand/presentation/bloc/brand_bloc.dart';

import 'brand_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBrandList>()])
void main() {
  late BrandBloc brandBloc;
  late MockGetBrandList getBrandList;

  setUp(() {
    getBrandList = MockGetBrandList();
    brandBloc = BrandBloc(getBrandList);
  });

  test('initial state should be empty', () {
    expect(brandBloc.state, const BrandState.initial());
  });

  group('brand bloc', () {
    final tBrandModel = BrandModel(
      id: "a48e4df0-145d-104f-aff0-6f88962d8579",
      name: 'Nike',
      logo:
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187',
      totalProducts: 88,
    );

    test('get data from getBrandList', () async {
      //arrange
      when(getBrandList()).thenAnswer(
        (_) async => BaseResponseList(
          success: true,
          message: 'Success',
          data: [tBrandModel],
        ),
      );
      //act
      brandBloc.add(const BrandEvent.getBrandList());
      await untilCalled(getBrandList());
      //assert
      verify(getBrandList());
    });

    test(
        'should emit [Loading, Success] states when data is fetched successfully',
        () async* {
      //arrange
      when(getBrandList()).thenAnswer(
        (_) async => BaseResponseList(
          success: true,
          message: 'Success',
          data: [tBrandModel],
        ),
      );
      //assert later
      final expected = [
        const BrandState.loading(),
        BrandState.success(brandList: [tBrandModel])
      ];
      expectLater(brandBloc.state, emitsInOrder(expected));
      //act
      brandBloc.add(const BrandEvent.getBrandList());
    });

    test('should emit [Loading, Error] states when data cannot be fetched',
        () async* {
      //arrange
      when(getBrandList()).thenAnswer(
        (_) async => const BaseResponseList(
          success: false,
          message: 'Error',
          data: [],
        ),
      );
      //assert later
      final expected = [
        const BrandState.loading(),
        const BrandState.error(errorMsg: 'Error')
      ];
      expectLater(brandBloc.state, emitsInOrder(expected));
      //act
      brandBloc.add(const BrandEvent.getBrandList());
    });
  });
}
