import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/features/auth/presentation/pages/login_page.dart';
import 'package:shoesly_priority_soft/features/profile/presentation/profile_page.dart';

import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/cart/data/models/cart_model.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/order/presentation/pages/order_summary_page.dart';
import '../../features/products/data/models/product_filter.dart';
import '../../features/products/data/models/product_model.dart';
import '../../features/products/presentation/pages/dashboard_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/products/presentation/pages/product_filter_page.dart';
import '../../features/reviews/presentation/pages/review_page.dart';
import '../../features/splash_screen/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRouter.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRouter.page,
        ),
        AutoRoute(
          page: RegisterRouter.page,
        ),
        AutoRoute(
          page: ProfileRouter.page,
        ),
        AutoRoute(
          page: DashboardRouter.page,
        ),
        AutoRoute(
          page: ProductDetailRouter.page,
        ),
        AutoRoute(
          page: ProductFilterRouter.page,
        ),
        AutoRoute(
          page: ReviewPageRouter.page,
        ),
        AutoRoute(
          page: CartPageRouter.page,
        ),
        AutoRoute(
          page: OrderSummaryPageRouter.page,
        ),
      ];
}
