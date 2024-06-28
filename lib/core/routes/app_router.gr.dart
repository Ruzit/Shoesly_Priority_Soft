// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartPage(),
      );
    },
    DashboardRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    OrderSummaryPageRouter.name: (routeData) {
      final args = routeData.argsAs<OrderSummaryPageRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderSummaryPage(
          key: args.key,
          cartItems: args.cartItems,
        ),
      );
    },
    ProductDetailRouter.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductFilterRouter.name: (routeData) {
      final args = routeData.argsAs<ProductFilterRouterArgs>(
          orElse: () => const ProductFilterRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductFilterPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
    ReviewPageRouter.name: (routeData) {
      final args = routeData.argsAs<ReviewPageRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    SplashRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [CartPage]
class CartPageRouter extends PageRouteInfo<void> {
  const CartPageRouter({List<PageRouteInfo>? children})
      : super(
          CartPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'CartPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRouter extends PageRouteInfo<void> {
  const DashboardRouter({List<PageRouteInfo>? children})
      : super(
          DashboardRouter.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderSummaryPage]
class OrderSummaryPageRouter extends PageRouteInfo<OrderSummaryPageRouterArgs> {
  OrderSummaryPageRouter({
    Key? key,
    required List<CartModel> cartItems,
    List<PageRouteInfo>? children,
  }) : super(
          OrderSummaryPageRouter.name,
          args: OrderSummaryPageRouterArgs(
            key: key,
            cartItems: cartItems,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderSummaryPageRouter';

  static const PageInfo<OrderSummaryPageRouterArgs> page =
      PageInfo<OrderSummaryPageRouterArgs>(name);
}

class OrderSummaryPageRouterArgs {
  const OrderSummaryPageRouterArgs({
    this.key,
    required this.cartItems,
  });

  final Key? key;

  final List<CartModel> cartItems;

  @override
  String toString() {
    return 'OrderSummaryPageRouterArgs{key: $key, cartItems: $cartItems}';
  }
}

/// generated route for
/// [ProductDetailPage]
class ProductDetailRouter extends PageRouteInfo<ProductDetailRouterArgs> {
  ProductDetailRouter({
    Key? key,
    required ProductModel product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRouter.name,
          args: ProductDetailRouterArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRouter';

  static const PageInfo<ProductDetailRouterArgs> page =
      PageInfo<ProductDetailRouterArgs>(name);
}

class ProductDetailRouterArgs {
  const ProductDetailRouterArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final ProductModel product;

  @override
  String toString() {
    return 'ProductDetailRouterArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [ProductFilterPage]
class ProductFilterRouter extends PageRouteInfo<ProductFilterRouterArgs> {
  ProductFilterRouter({
    Key? key,
    ProductFilter? filter,
    List<PageRouteInfo>? children,
  }) : super(
          ProductFilterRouter.name,
          args: ProductFilterRouterArgs(
            key: key,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductFilterRouter';

  static const PageInfo<ProductFilterRouterArgs> page =
      PageInfo<ProductFilterRouterArgs>(name);
}

class ProductFilterRouterArgs {
  const ProductFilterRouterArgs({
    this.key,
    this.filter,
  });

  final Key? key;

  final ProductFilter? filter;

  @override
  String toString() {
    return 'ProductFilterRouterArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [ReviewPage]
class ReviewPageRouter extends PageRouteInfo<ReviewPageRouterArgs> {
  ReviewPageRouter({
    Key? key,
    required ProductModel product,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewPageRouter.name,
          args: ReviewPageRouterArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewPageRouter';

  static const PageInfo<ReviewPageRouterArgs> page =
      PageInfo<ReviewPageRouterArgs>(name);
}

class ReviewPageRouterArgs {
  const ReviewPageRouterArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final ProductModel product;

  @override
  String toString() {
    return 'ReviewPageRouterArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRouter extends PageRouteInfo<void> {
  const SplashRouter({List<PageRouteInfo>? children})
      : super(
          SplashRouter.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
