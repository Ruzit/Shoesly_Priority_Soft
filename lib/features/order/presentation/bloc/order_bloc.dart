import 'package:esewa_flutter_sdk/esewa_config.dart' as esewa;
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/order/domain/usecases/add_order.dart';

import '../../data/models/add_order_request.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final AddOrder _addOrder;
  OrderBloc(this._addOrder) : super(const _Initial()) {
    on<OrderEvent>(
      (event, emit) async {
        await event.whenOrNull(
          addOrder: (order) async {
            emit(const OrderState.loading());
            final result = await _addOrder(order: order);
            if (result.success) {
              emit(OrderState.success(message: result.message));
            } else {
              emit(OrderState.error(errorMsg: result.message));
            }
          },
          payWithEsewa: (order) {
            try {
              EsewaFlutterSdk.initPayment(
                esewaConfig: esewa.EsewaConfig(
                  environment: esewa.Environment.test,
                  clientId:
                      'JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R',
                  secretId: 'BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==',
                ),
                esewaPayment: EsewaPayment(
                    productId: "1d71jd81",
                    productName: order.items.first.product.name,
                    productPrice: order.total.toString(),
                    callbackUrl: ''),
                onPaymentSuccess: (EsewaPaymentSuccessResult data) {
                  debugPrint(":::SUCCESS::: => $data");
                  emit(const OrderState.paySuccess());
                },
                onPaymentFailure: (data) {
                  debugPrint(":::FAILURE::: => $data");
                  emit(const OrderState.error(errorMsg: "Payment Failed"));
                },
                onPaymentCancellation: (data) {
                  debugPrint(":::CANCELLATION::: => $data");
                  emit(const OrderState.error(errorMsg: "Payment Cancelled"));
                },
              );
            } on Exception catch (e) {
              debugPrint("EXCEPTION : ${e.toString()}");
              emit(OrderState.error(errorMsg: e.toString()));
            }
          },
        );
      },
    );
  }
}
