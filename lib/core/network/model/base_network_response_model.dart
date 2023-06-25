class BaseNetworkResponse<T> {
  final int statusCode;
  final bool isSuccess;
  final T? data;
  final String? errorMessage;

  BaseNetworkResponse.success({
    required this.data,
    required this.statusCode,
  })  : isSuccess = true,
        errorMessage = null;

  BaseNetworkResponse.failure({
    required this.errorMessage,
    required this.statusCode,
  })  : isSuccess = false,
        data = null;
}

class ClientResponseModel {
  final int statusCode;
  final String response;

  ClientResponseModel({
    required this.statusCode,
    required this.response,
  });
}
