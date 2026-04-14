class AppError {
  final String errorMessage;

  AppError({required this.errorMessage});
}

class NetworkError extends AppError {
  NetworkError({String error = 'Please check your internet connection'})
    : super(errorMessage: error);
}

class ServerError extends AppError {
  ServerError({String error = 'Server is down,please try again later'})
    : super(errorMessage: error);
}

class ApiError extends AppError {
  ApiError({String error = 'ApiError,please try again later'})
    : super(errorMessage: error);
}

class IgnoredError extends AppError {
  IgnoredError({String error = ''}) : super(errorMessage: error);
}

class UnKnownError extends AppError {
  UnKnownError({String error = 'someThing went Wrong , please try again later'})
    : super(errorMessage: error);
}
