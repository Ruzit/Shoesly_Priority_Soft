import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/order/presentation/widgets/order_information_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/utils/spacing_utils.dart';
import '../../../cart/presentation/widgets/total_price_and_button_widget.dart';
import '../widgets/order_payment_info_widget.dart';
import '../widgets/order_product_detail_widget.dart';

@RoutePage(name: 'OrderSummaryPageRouter')
class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseView(
      titleText: 'Order Summary',
      centerTitle: true,
      appBarColor: const Color(0xfff9f9f9),
      color: const Color(0xfff9f9f9),
      bottomNavigationBar: TotalPriceAndButtonWidget(
        buttonText: "PAYMENT",
        title: "Grand Total",
        price: "\$ 725",
        onButtonPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderInformationWidget(),
            verticalSpace(space: 24.0),
            const OrderProductDetailWidget(),
            verticalSpace(space: 24.0),
            const OrderPaymentInfoWidget(),
            verticalSpace(space: 24.0),
          ],
        ).padding(horizontal: 24),
      ),
    );
  }
}
