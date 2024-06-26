// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_population.dart' as _i20;
import '../../features/brand/data/repository/brand_repository_impl.dart'
    as _i13;
import '../../features/brand/domain/repository/brand_repository.dart' as _i12;
import '../../features/brand/domain/usecases/get_brand_list.dart' as _i15;
import '../../features/brand/presentation/bloc/brand_bloc.dart' as _i21;
import '../../features/cart/data/repository/cart_repository_impl.dart' as _i19;
import '../../features/cart/domain/repository/cart_repository.dart' as _i18;
import '../../features/cart/domain/usecases/add_to_cart.dart' as _i22;
import '../../features/cart/domain/usecases/delete_cart_item.dart' as _i24;
import '../../features/cart/domain/usecases/get_cart_items.dart' as _i25;
import '../../features/cart/domain/usecases/update_cart_item.dart' as _i23;
import '../../features/cart/presentation/bloc/cart_bloc.dart' as _i28;
import '../../features/order/data/repository/order_repository_impl.dart'
    as _i17;
import '../../features/order/domain/repository/order_repository.dart' as _i16;
import '../../features/order/domain/usecases/add_order.dart' as _i30;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i32;
import '../../features/products/data/repository/product_repository_impl.dart'
    as _i11;
import '../../features/products/domain/repository/product_repository.dart'
    as _i10;
import '../../features/products/domain/usecases/get_product_list.dart' as _i27;
import '../../features/products/presentation/bloc/product_bloc.dart' as _i31;
import '../../features/reviews/data/repository/review_repository_impl.dart'
    as _i6;
import '../../features/reviews/domain/repository/review_repository.dart' as _i5;
import '../../features/reviews/domain/usecases/get_product_reviews.dart'
    as _i14;
import '../../features/reviews/presentation/bloc/review_bloc.dart' as _i29;
import '../routes/auth_guard.dart' as _i26;
import '../utils/i_session_manager.dart' as _i7;
import '../utils/session_manager.dart' as _i8;
import 'local_module.dart' as _i33;

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
    gh.factory<_i7.ISessionManager>(
        () => _i8.SessionManager(gh<_i9.FlutterSecureStorage>()));
    gh.factory<_i10.IProductRepository>(
        () => _i11.ProductRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i12.IBrandRepository>(
        () => _i13.BrandRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i14.GetProductReviews>(
        () => _i14.GetProductReviews(gh<_i5.IReviewRepository>()));
    gh.factory<_i15.GetBrandList>(
        () => _i15.GetBrandList(gh<_i12.IBrandRepository>()));
    gh.factory<_i16.IOrderRepository>(() => _i17.OrderRepositoryImpl(
          gh<_i3.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i18.ICartRepository>(
        () => _i19.CartRepositoryImpl(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i20.DataPopulation>(() => _i20.DataPopulation(
          gh<_i12.IBrandRepository>(),
          gh<_i3.FirebaseFirestore>(),
          gh<_i10.IProductRepository>(),
        ));
    gh.factory<_i21.BrandBloc>(() => _i21.BrandBloc(gh<_i15.GetBrandList>()));
    gh.factory<_i22.AddToCart>(
        () => _i22.AddToCart(gh<_i18.ICartRepository>()));
    gh.factory<_i23.UpdateCartItem>(
        () => _i23.UpdateCartItem(gh<_i18.ICartRepository>()));
    gh.factory<_i24.DeleteCartItem>(
        () => _i24.DeleteCartItem(gh<_i18.ICartRepository>()));
    gh.factory<_i25.GetCartItems>(
        () => _i25.GetCartItems(gh<_i18.ICartRepository>()));
    gh.factory<_i26.AuthGuard>(() => _i26.AuthGuard(gh<_i7.ISessionManager>()));
    gh.factory<_i27.GetProductList>(
        () => _i27.GetProductList(gh<_i10.IProductRepository>()));
    gh.factory<_i28.CartBloc>(() => _i28.CartBloc(
          gh<_i22.AddToCart>(),
          gh<_i25.GetCartItems>(),
          gh<_i24.DeleteCartItem>(),
          gh<_i23.UpdateCartItem>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i29.ReviewBloc>(
        () => _i29.ReviewBloc(gh<_i14.GetProductReviews>()));
    gh.factory<_i30.AddOrder>(() => _i30.AddOrder(gh<_i16.IOrderRepository>()));
    gh.factory<_i31.ProductBloc>(
        () => _i31.ProductBloc(gh<_i27.GetProductList>()));
    gh.factory<_i32.OrderBloc>(() => _i32.OrderBloc(gh<_i30.AddOrder>()));
    return this;
  }
}

class _$LocalModule extends _i33.LocalModule {}
