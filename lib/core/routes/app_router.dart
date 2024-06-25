import 'package:auto_route/auto_route.dart';
import 'package:shoesly_priority_soft/features/products/presentation/pages/product_detail_page.dart';
import 'package:shoesly_priority_soft/features/splash_screen/splash_page.dart';

import '../../features/products/presentation/pages/dashboard_page.dart';
import '../../features/products/presentation/pages/product_filter_page.dart';

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
          page: DashboardRouter.page,
        ),
        AutoRoute(
          page: ProductDetailRouter.page,
        ),
        AutoRoute(
          page: ProductFilterRouter.page,
        ),
      ];
}
