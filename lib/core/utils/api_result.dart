import 'package:ecomerce_app/core/utils/app_error.dart';

sealed class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult<T>;
  bool get isError => this is ErrorApiResult<T>;

  AppError? get getError {
    if (this is ErrorApiResult<T>) {
      return (this as ErrorApiResult<T>).error;
    }
    return null;
  }

  T? get getData {
    if (this is SuccessApiResult<T>) {
      return (this as SuccessApiResult<T>).data;
    }
    return null;
  }
}

class SuccessApiResult<T> extends ApiResult<T> {
  @override
  final T? data;
  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  @override
  final AppError? error;
  ErrorApiResult(this.error);
}
