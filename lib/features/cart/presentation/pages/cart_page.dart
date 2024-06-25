import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/widgets/total_price_and_button_widget.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../widgets/cart_tile.dart';

@RoutePage(name: 'CartPageRouter')
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Cart',
      centerTitle: true,
      appBarColor: const Color(0xfff9f9f9),
      color: const Color(0xfff9f9f9),
      bottomNavigationBar: TotalPriceAndButtonWidget(
        buttonText: "CHECK OUT",
        title: "Grand Total",
        price: "\$ 235",
        onButtonPressed: () {
          context.router.push(const OrderSummaryPageRouter());
        },
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const CartTile(),
        separatorBuilder: (context, index) => verticalSpace(space: 8.0),
        itemCount: 4,
      ),
    );
  }
}
