part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.error({required String errorMsg}) = _Error;
  const factory OrderState.success({required String message}) = _Success;
}
