import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly_priority_soft/core/extensions/cart_extension.dart';
import 'package:shoesly_priority_soft/core/widgets/app_base_view.dart';
import 'package:shoesly_priority_soft/features/order/presentation/widgets/order_information_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/enum/payment_method.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/shared/notification/notification_service.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/widgets/total_price_and_button_widget.dart';
import '../../data/models/add_order_request.dart';
import '../bloc/order_bloc.dart';
import '../widgets/order_payment_info_widget.dart';
import '../widgets/order_product_detail_widget.dart';

@RoutePage(name: 'OrderSummaryPageRouter')
class OrderSummaryPage extends StatefulWidget {
  final List<CartModel> cartItems;
  const OrderSummaryPage({super.key, required this.cartItems});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final OrderBloc _orderBloc = getIt<OrderBloc>();
  final double shippingFee = 20;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _orderBloc,
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              EasyLoading.show(status: "Placing your order");
            },
            success: (msg) async {
              EasyLoading.dismiss();
              await PushNotificationService.showLocalNotification(
                message: 'Your order has been placed successfully!',
              );

              Future.delayed(const Duration(seconds: 1), () {
                context.read<CartBloc>().add(const CartEvent.getCartItems());
                context.router.pushAndPopUntil(const DashboardRouter(),
                    predicate: (f) => false);
              });
            },
            error: EasyLoading.showError,
          );
        },
        child: AppBaseView(
          titleText: 'Order Summary',
          centerTitle: true,
          appBarColor: const Color(0xfff9f9f9),
          color: const Color(0xfff9f9f9),
          bottomNavigationBar: TotalPriceAndButtonWidget(
            buttonText: "PAYMENT",
            title: "Grand Total",
            price:
                "\$${(widget.cartItems.total + shippingFee).toStringAsFixed(2)}",
            onButtonPressed: () {
              _orderBloc.add(
                OrderEvent.addOrder(
                  order: AddOrderRequest(
                    items: widget.cartItems,
                    subTotal: widget.cartItems.total,
                    shippingFee: shippingFee,
                    shippingAddress:
                        ShippingAddress(address: "Thimi-06, Bhaktapur, Nepal"),
                    total: widget.cartItems.total + shippingFee,
                    paymentMethod: PaymentMethod.cash,
                  ),
                ),
              );
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrderInformationWidget(),
                verticalSpace(space: 24.0),
                OrderProductDetailWidget(
                  items: widget.cartItems,
                ),
                verticalSpace(space: 24.0),
                OrderPaymentInfoWidget(
                  subTotal: widget.cartItems.total,
                  shippingFee: shippingFee,
                ),
                verticalSpace(space: 24.0),
              ],
            ).padding(horizontal: 24),
          ),
        ),
      ),
    );
  }
}
