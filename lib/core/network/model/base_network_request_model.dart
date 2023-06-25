class BaseNetworkRequestModel {
  final String api;
  final Map<String, String> queryParams;
  final Map<String, String> headers;
  final Map<dynamic, dynamic> body;

  BaseNetworkRequestModel({
    required this.api,
    required this.queryParams,
    required this.headers,
    required this.body,
  });
}


