import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import 'order_payment_tile.dart';

class OrderPaymentInfoWidget extends StatelessWidget {
  final double subTotal;
  final double shippingFee;
  const OrderPaymentInfoWidget(
      {super.key, required this.subTotal, required this.shippingFee});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Detail",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        verticalSpace(space: 8.0),
        OrderPaymentTile(
          title: "Sub Total",
          price: "\$${subTotal.toStringAsFixed(2)}",
        ),
        verticalSpace(space: 12.0),
        OrderPaymentTile(
          title: "Shipping",
          price: "\$${shippingFee.toStringAsFixed(2)}",
        ),
        verticalSpace(space: 16.0),
        const Divider(
          height: 1,
          thickness: 1,
          color: colorLightGrey,
        ),
        verticalSpace(space: 16.0),
        OrderPaymentTile(
          title: "Grand Total",
          price: "\$${(subTotal + shippingFee).toStringAsFixed(2)}",
          priceStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
