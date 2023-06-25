import 'package:base_project/core/network/model/base_network_response_model.dart';

import 'base_network_assistant.dart';
import 'model/base_network_request_model.dart';

typedef GenericNetworkCallBack<T> = T Function(String);

abstract class IBaseNetworkAssistant {
  void prepare();

  Future<BaseNetworkResponse<T>> get<T>({
    required BaseNetworkRequestModel request,
    required GenericNetworkCallBack<T> jsonParserCallBack,
  });

  Future<BaseNetworkResponse<T>> post<T>({
    required BaseNetworkRequestModel request,
    required GenericNetworkCallBack<T> jsonParserCallBack,
  });
}
