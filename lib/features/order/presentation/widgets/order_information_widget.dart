import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';

class OrderInformationWidget extends StatelessWidget {
  const OrderInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Information",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        verticalSpace(space: 8.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Payment Method",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ).padding(bottom: 8),
          subtitle: Text(
            "Esewa",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorDarkGrey,
                ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right,
            ),
          ),
        ),
        verticalSpace(space: 8.0),
        const Divider(
          height: 1,
          thickness: 1,
          color: colorLightGrey,
        ),
        verticalSpace(space: 8.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Location",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ).padding(bottom: 8),
          subtitle: Text(
            "Kathmandu, Nepal",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorDarkGrey,
                ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right,
            ),
          ),
        ),
      ],
    );
  }
}
