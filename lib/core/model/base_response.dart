import 'package:equatable/equatable.dart';

class BaseResponse<T> extends Equatable {
  final bool success;
  final String message;
  final T? data;
  const BaseResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];
}

typedef BaseResponseList<T> = BaseResponse<List<T>>;
