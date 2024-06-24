import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/brand_list_widget.dart';

@RoutePage(name: 'DashboardRouter')
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
          const BrandListWidget(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: colorLightGrey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Assets.icons.jordan
                                .svg(
                                  colorFilter: const ColorFilter.mode(
                                    productTileColor,
                                    BlendMode.srcIn,
                                  ),
                                )
                                .padding(top: 8, left: 8, right: 8),
                            Image.asset(
                              Assets.images.jordan1.path,
                            ).padding(horizontal: 16, vertical: 8).expanded(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Jordan 1 Retro High Tie Dye',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: <Widget>[
                        Assets.icons.star.svg(
                          height: 14,
                          width: 14,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '4.5',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '(1045 reviews)',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: productTileColor,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '\$ 200.00',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
