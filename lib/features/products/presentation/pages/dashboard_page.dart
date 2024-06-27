import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:shoesly_priority_soft/features/products/presentation/bloc/product_bloc.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_tile.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../brand/data/models/brand_model.dart';
import '../../data/models/product_filter.dart';
import '../widgets/brand_list_slider.dart';

@RoutePage(name: 'DashboardRouter')
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final productBloc = getIt<ProductBloc>();
  final brandBloc = getIt<BrandBloc>();

  BrandModel? selectedBrand;
  List<BrandModel> brands = [];

  ProductFilter filter = ProductFilter(limit: ProductFilter.perPage);

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
            onPressed: () => context.router.push(const CartPageRouter()),
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) =>
                productBloc..add(ProductEvent.getProductList(filter: filter)),
          ),
          BlocProvider(
            create: (context) =>
                brandBloc..add(const BrandEvent.getBrandList()),
          ),
        ],
        child: BlocListener<BrandBloc, BrandState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (brandList) {
                if (brandList.isNotEmpty) {
                  setState(() {
                    brands = brandList;
                  });
                }
              },
            );
          },
          child: Column(
            children: <Widget>[
              BrandListSlider(
                onSelected: (brand) {
                  setState(() {
                    filter.brand = brand;
                    selectedBrand = brand;
                  });
                  productBloc.add(ProductEvent.getProductList(filter: filter));
                },
                selectedBrand: selectedBrand,
              ),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox(),
                      success: (products) {
                        if (products.isEmpty) {
                          return Center(
                            child: Text(
                              'No products found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                          );
                        }
                        return GridView.builder(
                          padding: const EdgeInsets.all(16.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ProductTile(
                            product: products[index],
                            brand: brands.firstWhere(
                                (brand) => brand.name == products[index].brand),
                          ),
                          itemCount: products.length,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
