import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_tile.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/routes/app_router.dart';
import '../widgets/brand_list_slider.dart';

@RoutePage(name: 'DashboardRouter')
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      color: Colors.white,
      appBar: AppBar(
        title: Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        toolbarHeight: 80,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.bag.svg(),
          ),
        ],
      ),
      fabLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.push(const ProductFilterRouter()),
        label: Text(
          'FILTER',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        icon: Assets.icons.filter.svg(
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        backgroundColor: Colors.black,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 22),
        shape: const StadiumBorder(),
        extendedIconLabelSpacing: 12,
      ).height(45),
      body: Column(
        children: <Widget>[
          const BrandListSlider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => const ProductTile(),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
