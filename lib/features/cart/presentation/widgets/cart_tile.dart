import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/cart_quantity_button.dart';
import 'package:shoesly_priority_soft/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ObjectKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: waringColor,
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: colorLightGrey,
            ),
            child: Assets.images.jordan1.image().padding(all: 12),
          ),
          horizontalSpace(space: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Jordan 1 Retro High Tie Dye',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Nike . Red Grey . 40',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: productTileColor),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '\$235,00',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    CartQuantityButton(
                      action: CartQuantityAction.remove,
                      quantity: 1,
                      onUpdate: (value) {},
                    ),
                    horizontalSpace(space: 8.0),
                    const Text('1'),
                    horizontalSpace(space: 8.0),
                    CartQuantityButton(
                      action: CartQuantityAction.add,
                      quantity: 1,
                      onUpdate: (value) {},
                    ),
                  ],
                ),
                verticalSpace(space: 4.0),
              ],
            ).height(100),
          )
        ],
      ).padding(all: 12),
    );
  }
}
