import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/core/widgets/app_button.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/brand_filter_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/color_filter_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/gender_filter_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/price_filter_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_sort_view.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../data/models/product_filter.dart';

@RoutePage(name: 'ProductFilterRouter')
class ProductFilterPage extends StatefulWidget {
  final ProductFilter? filter;
  const ProductFilterPage({super.key, this.filter});

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  late ProductFilter filter;
  @override
  void initState() {
    filter = widget.filter ?? ProductFilter(limit: ProductFilter.perPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Filter',
      centerTitle: true,
      bottomNavigationBar: Row(
        children: <Widget>[
          AppButton(
            buttonText: 'RESET (${widget.filter?.appliedCount})',
            height: 50,
            fontStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
            onPressed: () {
              setState(() {
                filter = ProductFilter(limit: ProductFilter.perPage);
              });
            },
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: Colors.white,
            borderColor: colorBorder,
          ).expanded(),
          AppButton(
            buttonText: 'APPLY',
            height: 50,
            fontStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            onPressed: () {
              context.router.maybePop(filter);
            },
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: blackColor,
          ).expanded(),
        ],
      ).padding(horizontal: 16).decorated(color: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BrandFilterView(
              onSelected: (value) {
                setState(() {
                  filter.brand = value;
                });
              },
              selectedBrand: filter.brand,
            ),
            verticalSpace(space: 16.0),
            PriceFilterView(
              priceRange: filter.priceRange,
              onChanged: (r) {
                setState(() {
                  filter.priceRange = r;
                });
              },
            ),
            verticalSpace(space: 24.0),
            ProductSortView(
              productSort: filter.sortBy,
              onSelected: (sort) {
                setState(() {
                  filter.sortBy = sort;
                });
              },
            ),
            verticalSpace(space: 24.0),
            GenderFilterView(
              gender: filter.gender,
              onSelected: (gen) {
                setState(() {
                  filter.gender = gen;
                });
              },
            ),
            verticalSpace(space: 24.0),
            ColorFilterView(
              color: filter.color,
              onSelected: (c) {
                setState(() {
                  filter.color = c;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
