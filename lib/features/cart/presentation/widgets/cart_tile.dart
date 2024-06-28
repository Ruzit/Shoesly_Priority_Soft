import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/enum/product_color.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_network_image.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/cart_quantity_button.dart';
import 'package:styled_widget/styled_widget.dart';

class CartTile extends StatelessWidget {
  final CartModel cartModel;
  final Function(int) onUpdate;
  final VoidCallback onDelete;
  const CartTile(
      {super.key,
      required this.cartModel,
      required this.onUpdate,
      required this.onDelete});

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
              onTap: onDelete,
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
            child: AppNetworkImage(url: cartModel.product.thumbnail)
                .padding(all: 12),
          ),
          horizontalSpace(space: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  cartModel.product.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${cartModel.product.brand}. ${cartModel.productColor!.text}. ${cartModel.size}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: productTileColor),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "\$${cartModel.product.price * cartModel.quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    CartQuantityButton(
                      action: CartQuantityAction.remove,
                      quantity: cartModel.quantity,
                      onUpdate: onUpdate,
                    ),
                    horizontalSpace(space: 12.0),
                    Text(
                      "${cartModel.quantity}",
                    ),
                    horizontalSpace(space: 12.0),
                    CartQuantityButton(
                      action: CartQuantityAction.add,
                      quantity: cartModel.quantity,
                      onUpdate: onUpdate,
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
