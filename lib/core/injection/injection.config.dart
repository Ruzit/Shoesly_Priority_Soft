// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_population.dart' as _i28;
import '../../features/brand/data/repository/brand_repository_impl.dart'
    as _i14;
import '../../features/brand/domain/repository/brand_repository.dart' as _i13;
import '../../features/brand/domain/usecases/get_brand_list.dart' as _i8;
import '../../features/brand/presentation/bloc/brand_bloc.dart' as _i7;
import '../../features/cart/data/repository/cart_repository_impl.dart' as _i25;
import '../../features/cart/domain/repository/cart_repository.dart' as _i24;
import '../../features/cart/domain/usecases/add_to_cart.dart' as _i16;
import '../../features/cart/domain/usecases/delete_cart_item.dart' as _i18;
import '../../features/cart/domain/usecases/get_cart_items.dart' as _i17;
import '../../features/cart/domain/usecases/update_cart_item.dart' as _i19;
import '../../features/cart/presentation/bloc/cart_bloc.dart' as _i15;
import '../../features/order/data/repository/order_repository_impl.dart'
    as _i21;
import '../../features/order/domain/repository/order_repository.dart' as _i20;
import '../../features/order/domain/usecases/add_order.dart' as _i27;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i26;
import '../../features/products/data/repository/product_repository_impl.dart'
    as _i12;
import '../../features/products/domain/repository/product_repository.dart'
    as _i11;
import '../../features/products/domain/usecases/get_product_list.dart' as _i23;
import '../../features/products/presentation/bloc/product_bloc.dart' as _i22;
import '../../features/reviews/data/repository/review_repository_impl.dart'
    as _i6;
import '../../features/reviews/domain/repository/review_repository.dart' as _i5;
import '../../features/reviews/domain/usecases/get_product_reviews.dart'
    as _i10;
import '../../features/reviews/presentation/bloc/review_bloc.dart' as _i9;
import 'local_module.dart' as _i29;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    gh.singleton<_i3.FirebaseFirestore>(() => localModule.firestore());
    gh.singleton<_i4.FirebaseAuth>(() => localModule.firebaseAuth());
    gh.factory<_i5.IReviewRepository>(() => _i6.ReviewRepositoryImpl());
    gh.factory<_i7.BrandBloc>(() => _i7.BrandBloc(gh<_i8.GetBrandList>()));
    gh.factory<_i9.ReviewBloc>(
        () => _i9.ReviewBloc(gh<_i10.GetProductReviews>()));
    gh.factory<_i11.IProductRepository>(
        () => _i12.ProductRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i13.IBrandRepository>(
        () => _i14.BrandRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i15.CartBloc>(() => _i15.CartBloc(
          gh<_i16.AddToCart>(),
          gh<_i17.GetCartItems>(),
          gh<_i18.DeleteCartItem>(),
          gh<_i19.UpdateCartItem>(),
        ));
    gh.factory<_i20.IOrderRepository>(() => _i21.OrderRepositoryImpl(
          gh<_i3.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i22.ProductBloc>(
        () => _i22.ProductBloc(gh<_i23.GetProductList>()));
    gh.factory<_i24.ICartRepository>(
        () => _i25.CartRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i26.OrderBloc>(() => _i26.OrderBloc(gh<_i27.AddOrder>()));
    gh.factory<_i28.DataPopulation>(() => _i28.DataPopulation(
          gh<_i13.IBrandRepository>(),
          gh<_i3.FirebaseFirestore>(),
          gh<_i11.IProductRepository>(),
        ));
    return this;
  }
}

class _$LocalModule extends _i29.LocalModule {}
