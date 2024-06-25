import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import 'order_payment_tile.dart';

class OrderPaymentInfoWidget extends StatelessWidget {
  const OrderPaymentInfoWidget({super.key});

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
        const OrderPaymentTile(
          title: "Sub Total",
          price: "\$ 705",
        ),
        verticalSpace(space: 12.0),
        const OrderPaymentTile(
          title: "Shipping",
          price: "\$ 20",
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
          price: "\$ 725",
          priceStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
