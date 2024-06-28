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
        );
      },
    );
  }
}
