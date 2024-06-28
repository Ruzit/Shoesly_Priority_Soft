import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shoesly_priority_soft/core/model/base_response.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';
import 'package:shoesly_priority_soft/features/brand/domain/repository/brand_repository.dart';
import 'package:shoesly_priority_soft/features/brand/domain/usecases/get_brand_list.dart';

import 'get_brand_list_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IBrandRepository>()])
void main() {
  late GetBrandList useCase;
  late MockIBrandRepository mockBrandRepository;

  setUp(() {
    mockBrandRepository = MockIBrandRepository();
    useCase = GetBrandList(mockBrandRepository);
  });

  final tBrandModel = BrandModel(
    id: "a48e4df0-145d-104f-aff0-6f88962d8579",
    name: 'Nike',
    logo:
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187',
    totalProducts: 88,
  );

  test('should get news from repo', () async {
    when(mockBrandRepository.getBrandList()).thenAnswer((_) async =>
        BaseResponseList(
            success: true, message: 'Success', data: [tBrandModel]));
    final result = await useCase();
    expect(
        result,
        BaseResponseList(
            success: true, message: 'Success', data: [tBrandModel]));
    verify(mockBrandRepository.getBrandList());
    verifyNoMoreInteractions(mockBrandRepository);
  });
}
