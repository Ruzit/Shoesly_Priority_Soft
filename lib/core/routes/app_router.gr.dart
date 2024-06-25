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
    DashboardRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    ProductDetailRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductDetailPage(),
      );
    },
    ProductFilterRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductFilterPage(),
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
/// [ProductDetailPage]
class ProductDetailRouter extends PageRouteInfo<void> {
  const ProductDetailRouter({List<PageRouteInfo>? children})
      : super(
          ProductDetailRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
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
