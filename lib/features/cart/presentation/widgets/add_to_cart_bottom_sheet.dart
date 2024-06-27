import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/cart_quantity_button.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/total_price_and_button_widget.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';

class AddToCartBottomSheet extends StatefulWidget {
  final ProductModel product;
  const AddToCartBottomSheet({super.key, required this.product});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int quantity = 1;
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = quantity.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add to cart",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          context.maybePop();
                        },
                        icon: const Icon(Icons.close, color: blackColor))
                  ],
                ),
                verticalSpace(space: 12.0),
                Text(
                  'Quantity',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpace(space: 8.0),
                TextField(
                  controller: _quantityController,
                  maxLength: 2,
                  onChanged: (value) {
                    setState(() {
                      quantity = int.parse(value.isEmpty ? '0' : value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter total quantity (Eg: 3)',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: lightText),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: blackColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: blackColor, width: 2.0),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CartQuantityButton(
                            action: CartQuantityAction.remove,
                            quantity: quantity,
                            onUpdate: (value) {
                              setState(() {
                                quantity = value;
                                _quantityController.text = value.toString();
                              });
                            }),
                        horizontalSpace(space: 15),
                        CartQuantityButton(
                          action: CartQuantityAction.add,
                          quantity: quantity,
                          onUpdate: (value) {
                            setState(() {
                              quantity = value;
                              _quantityController.text = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: blackColor),
                    ),
                  ),
                ),
              ],
            ).padding(horizontal: 20),
            verticalSpace(space: 12.0),
            TotalPriceAndButtonWidget(
              buttonText: 'ADD TO CART',
              title: 'Total Price',
              price: "\$${widget.product.price * quantity}",
              onButtonPressed: () {
                context.maybePop(quantity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
