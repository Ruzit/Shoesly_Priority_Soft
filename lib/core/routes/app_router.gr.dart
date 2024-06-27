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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductFilterPage(),
      );
    },
    ReviewPageRouter.name: (routeData) {
      final args = routeData.argsAs<ReviewPageRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewPage(
          key: args.key,
          productId: args.productId,
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
class ProductFilterRouter extends PageRouteInfo<void> {
  const ProductFilterRouter({List<PageRouteInfo>? children})
      : super(
          ProductFilterRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProductFilterRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewPage]
class ReviewPageRouter extends PageRouteInfo<ReviewPageRouterArgs> {
  ReviewPageRouter({
    Key? key,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewPageRouter.name,
          args: ReviewPageRouterArgs(
            key: key,
            productId: productId,
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
    required this.productId,
  });

  final Key? key;

  final String productId;

  @override
  String toString() {
    return 'ReviewPageRouterArgs{key: $key, productId: $productId}';
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
