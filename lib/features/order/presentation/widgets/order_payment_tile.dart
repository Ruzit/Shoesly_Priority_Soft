import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';

class OrderPaymentTile extends StatelessWidget {
  final String title;
  final String price;
  final TextStyle? priceStyle;
  const OrderPaymentTile({
    super.key,
    required this.title,
    required this.price,
    this.priceStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorDarkGrey,
              ),
        ),
        const Spacer(),
        Text(
          price,
          style: priceStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
