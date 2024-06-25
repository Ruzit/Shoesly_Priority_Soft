import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../core/widgets/app_button.dart';

class TotalPriceAndButtonWidget extends StatelessWidget {
  final String buttonText;
  final String title;
  final String price;
  final VoidCallback onButtonPressed;
  const TotalPriceAndButtonWidget({
    super.key,
    required this.buttonText,
    required this.title,
    required this.price,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: productTileColor),
            ),
            verticalSpace(space: 4.0),
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ).expanded(),
        AppButton(
          buttonText: buttonText,
          fontStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          onPressed: onButtonPressed,
          width: MediaQuery.of(context).size.width * 0.4,
          backgroundColor: blackColor,
        ),
      ],
    ).padding(horizontal: 16).decorated(color: Colors.white);
  }
}
