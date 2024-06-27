import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly_priority_soft/core/enum/product_color.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/total_price_and_button_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_description_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_image_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_info_widget.dart';
import 'package:shoesly_priority_soft/features/products/presentation/widgets/product_size_widget.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/widgets/add_to_cart_bottom_sheet.dart';
import '../../../cart/presentation/widgets/add_to_cart_success_bottom_sheet.dart';
import '../../data/models/product_model.dart';
import '../widgets/product_review_widget.dart';

@RoutePage(name: 'ProductDetailRouter')
class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double? selectedSize;
  ProductColor? selectedColor;

  final cartBloc = getIt<CartBloc>();

  @override
  void initState() {
    selectedColor = widget.product.colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          // loading: EasyLoading.show,
          error: (message) => EasyLoading.showError(message),
          success: (msg) => showModalBottomSheet(
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
          ),
        );
      },
      child: AppBaseView(
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
          price: '\$${widget.product.price}',
          onButtonPressed: selectedColor == null || selectedSize == null
              ? () {
                  EasyLoading.showToast(
                    'Please, select size and color of the product to continue.',
                  );
                }
              : () async {
                  final count = await showModalBottomSheet(
                    showDragHandle: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: AddToCartBottomSheet(
                          product: widget.product,
                        ),
                      ),
                    ),
                  );
                  if (count != null && count > 0) {
                    if (mounted) {
                      context.read<CartBloc>().add(
                            CartEvent.addToCart(
                              AddToCartRequestModel(
                                product: widget.product,
                                quantity: count,
                                productColor: selectedColor,
                                size: selectedSize,
                              ),
                            ),
                          );
                    }
                  } else {
                    EasyLoading.showToast(
                      'Please enter valid product quantity.',
                    );
                  }
                },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProductImageWidget(
                images: widget.product.images,
                colors: widget.product.colors,
                onColorSelect: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                selectedColor: selectedColor!,
              ),
              verticalSpace(space: 16.0),
              ProductInfoWidget(
                name: widget.product.name,
                avgRating: widget.product.avgRating.toInt(),
                totalReviews: widget.product.totalReviews,
              ),
              verticalSpace(space: 16.0),
              ProductSizeWidget(
                sizes: widget.product.sizes.map((e) => e.toDouble()).toList(),
                onSizeSelect: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                },
                selectedSize: selectedSize,
              ),
              verticalSpace(space: 16.0),
              ProductDescriptionWidget(
                description: widget.product.description,
              ),
              verticalSpace(space: 16.0),
              ProductTopReviewsWidget(
                productId: widget.product.id!,
                totalReviews: widget.product.totalReviews,
              ),
              verticalSpace(space: 16.0),
            ],
          ).padding(horizontal: 24),
        ),
      ),
    );
  }
}
