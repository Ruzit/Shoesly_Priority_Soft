import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/total_price_and_button_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_description_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_image_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_info_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_size_widget.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/routes/app_router.dart';
import '../../../cart/presentation/widgets/add_to_cart_bottom_sheet.dart';
import '../../../cart/presentation/widgets/add_to_cart_success_bottom_sheet.dart';
import '../widgets/product_review_widget.dart';

@RoutePage(name: 'ProductDetailRouter')
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: '',
      actions: [
        IconButton(
          onPressed: () => context.router.push(const CartPageRouter()),
          icon: Assets.icons.bag.svg(),
        ),
      ],
      appBarColor: const Color(0xfff9f9f9),
      color: const Color(0xfff9f9f9),
      bottomNavigationBar: TotalPriceAndButtonWidget(
        buttonText: 'ADD TO CART',
        title: 'Price',
        price: '\$235.00',
        onButtonPressed: () async {
          final count = await showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (_) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddToCartBottomSheet(),
              ),
            ),
          );
          if (count != null) {
            if (mounted) {
              showModalBottomSheet(
                isScrollControlled: true,
                // ignore: use_build_context_synchronously
                context: context,
                builder: (_) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AddToCartSuccessBottomSheet(),
                  ),
                ),
              );
            }
          }
        },
      ),
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
            const ProductTopReviewsWidget(),
            verticalSpace(space: 16.0),
          ],
        ).padding(horizontal: 24),
      ),
    );
  }
}
