import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/enum/product_color.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../cart/data/models/cart_model.dart';

class OrderProductDetailWidget extends StatelessWidget {
  final List<CartModel> items;
  const OrderProductDetailWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Detail",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        verticalSpace(space: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                items[index].product.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ).padding(bottom: 8),
              subtitle: Text(
                "${items[index].product.brand}. ${items[index].productColor?.text}. ${items[index].size} Qty ${items[index].quantity}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorDarkGrey,
                    ),
              ),
              trailing: Text(
                "\$${items[index].product.price * items[index].quantity}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ],
    );
  }
}
