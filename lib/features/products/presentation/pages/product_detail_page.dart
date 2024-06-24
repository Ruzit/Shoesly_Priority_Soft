import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_description_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_image_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_info_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_size_widget.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../widgets/product_review_widget.dart';

@RoutePage(name: 'ProductDetailRouter')
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: '',
      actions: [
        IconButton(
          onPressed: () {},
          icon: Assets.icons.bag.svg(),
        ),
      ],
      appBarColor: const Color(0xfff9f9f9),
      color: const Color(0xfff9f9f9),
      bottomSheet: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: productTileColor),
              ),
              Text(
                '\$235.00',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ).expanded(),
          AppButton(
            buttonText: 'ADD TO CART',
            fontStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            onPressed: () {},
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: blackColor,
          ),
        ],
      ).padding(horizontal: 16).decorated(color: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ProductImageWidget(),
            verticalSpace(space: 16.0),
            const ProductInfoWidget(),
            verticalSpace(space: 16.0),
            const ProductSizeWidget(),
            verticalSpace(space: 16.0),
            const ProductDescriptionWidget(),
            verticalSpace(space: 16.0),
            const ProductReviewWidget(),
            verticalSpace(space: 16.0),
          ],
        ).padding(horizontal: 24),
      ),
    );
  }
}
