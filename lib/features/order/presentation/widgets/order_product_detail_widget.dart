import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';

class OrderProductDetailWidget extends StatelessWidget {
  const OrderProductDetailWidget({super.key});

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
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Jordan 1 Retro High Tie Dye",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ).padding(bottom: 8),
              subtitle: Text(
                "Nike . Red Grey . 40 . Qty 1",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorDarkGrey,
                    ),
              ),
              trailing: Text(
                "\$ 235",
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
