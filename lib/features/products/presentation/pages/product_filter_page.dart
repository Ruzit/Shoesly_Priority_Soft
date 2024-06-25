import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/enum/product_color.dart';
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

@RoutePage(name: 'ProductFilterRouter')
class ProductFilterPage extends StatelessWidget {
  const ProductFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Filter',
      centerTitle: true,
      bottomNavigationBar: Row(
        children: <Widget>[
          AppButton(
            buttonText: 'RESET (4)',
            height: 50,
            fontStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
            onPressed: () {},
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
            onPressed: () {},
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: blackColor,
          ).expanded(),
        ],
      ).padding(horizontal: 16).decorated(color: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BrandFilterView(),
            verticalSpace(space: 16.0),
            const PriceFilterView(),
            verticalSpace(space: 24.0),
            const ProductSortView(),
            verticalSpace(space: 24.0),
            const GenderFilterView(),
            verticalSpace(space: 24.0),
            const ColorFilterView(
              color: ProductColor.white,
            ),
          ],
        ),
      ),
    );
  }
}
