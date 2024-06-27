import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_priority_soft/core/extensions/cart_extension.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/total_price_and_button_widget.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_tile.dart';

@RoutePage(name: 'CartPageRouter')
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Cart',
      centerTitle: true,
      appBarColor: const Color(0xfff9f9f9),
      color: const Color(0xfff9f9f9),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              getCartItemssuccess: (cartItems) {
                if (cartItems.isEmpty) {
                  return const SizedBox();
                }
                return TotalPriceAndButtonWidget(
                  buttonText: "CHECK OUT",
                  title: "Grand Total",
                  price: "\$${cartItems.total.toStringAsFixed(2)}",
                  onButtonPressed: () {
                    context.router
                        .push(OrderSummaryPageRouter(cartItems: cartItems));
                  },
                );
              });
        },
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            getCartItemssuccess: (cartItems) {
              if (cartItems.isEmpty) {
                return const Center(
                  child: Text('Cart is empty'),
                );
              }
              return ListView.separated(
                itemBuilder: (context, index) => CartTile(
                  cartModel: cartItems[index],
                  onDelete: () {
                    context
                        .read<CartBloc>()
                        .add(CartEvent.deleteCartItem(cartItems[index].id!));
                  },
                  onUpdate: (quantity) {
                    context.read<CartBloc>().add(CartEvent.updateCartItem(
                        cartItems[index].id!, quantity));
                  },
                ),
                separatorBuilder: (context, index) => verticalSpace(space: 8.0),
                itemCount: cartItems.length,
              );
            },
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
