import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../gen/assets.gen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => context.router.push(const ProductDetailRouter()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: colorLightGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Assets.icons.jordan
                      .svg(
                        colorFilter: const ColorFilter.mode(
                          productTileColor,
                          BlendMode.srcIn,
                        ),
                      )
                      .padding(top: 8, left: 8, right: 8),
                  Image.asset(
                    Assets.images.jordan1.path,
                  ).padding(horizontal: 16, vertical: 8).expanded(),
                ],
              ),
            ),
          ),
          verticalSpace(space: 8.0),
          Text(
            'Jordan 1 Retro High Tie Dye',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          verticalSpace(space: 4.0),
          Row(
            children: <Widget>[
              Assets.icons.star.svg(
                height: 14,
                width: 14,
              ),
              horizontalSpace(space: 4.0),
              Text(
                '4.5',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              horizontalSpace(space: 4.0),
              Text(
                '(1045 reviews)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: productTileColor,
                    ),
              ),
            ],
          ),
          verticalSpace(space: 4.0),
          Text(
            '\$ 200.00',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
