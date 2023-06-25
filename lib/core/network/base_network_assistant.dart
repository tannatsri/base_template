import 'dart:convert';

import 'package:base_project/core/network/i_base_network_assistant.dart';
import 'package:base_project/core/network/model/base_network_request_model.dart';
import 'package:base_project/core/network/model/base_network_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class BaseNetworkAssistant extends IBaseNetworkAssistant {
  @override
  Future<BaseNetworkResponse<T>> get<T>({
    required BaseNetworkRequestModel request,
    required GenericNetworkCallBack<T> jsonParserCallBack,
  }) async {
    final uri = _getUri(
      request: request,
    );
    final headers = await _getHeaders(
      request: request,
    );
    final client = _getClient();
    final Response clientResponse = await client.get(
      uri,
      headers: headers,
    );
    final responseBody = await compute(
      utf8.decode,
      clientResponse.bodyBytes,
    );
    final response = _parseResponse(
      response: ClientResponseModel(
        statusCode: clientResponse.statusCode,
        response: responseBody,
      ),
      jsonParserCallBack: jsonParserCallBack,
      api: request.api,
    );
    return response;
  }

  @override
  Future<BaseNetworkResponse<T>> post<T>({
    required BaseNetworkRequestModel request,
    required GenericNetworkCallBack<T> jsonParserCallBack,
  }) async {
    final uri = _getUri(
      request: request,
    );
    final headers = await _getHeaders(
      request: request,
    );
    final client = _getClient();
    final Response clientResponse = await client.put(
      uri,
      headers: headers,
      body: jsonEncode(
        request.body,
      ),
    );
    final responseBody = await compute(
      utf8.decode,
      clientResponse.bodyBytes,
    );
    final response = _parseResponse(
      response: ClientResponseModel(
        statusCode: clientResponse.statusCode,
        response: responseBody,
      ),
      jsonParserCallBack: jsonParserCallBack,
      api: request.api,
    );
    return response;
  }

  @override
  void prepare() {
    // not needed anything
  }

  Uri _getUri({
    required BaseNetworkRequestModel request,
  }) {
    final String updatedApiWithAddedParams = _addQueryParamsToApi(
      api: request.api,
      queryParams: request.queryParams,
    );

    return Uri.parse(updatedApiWithAddedParams);
  }

  Future<Map<String, String>> _getHeaders({
    required BaseNetworkRequestModel request,
  }) async {
    // add base headers based on requirements here.

    final Map<String, String> headers = {};

    headers.addAll(request.headers);

    return headers;
  }

  Client _getClient() {
    return Client();
  }

  String _addQueryParamsToApi({
    required String api,
    required Map<String, String> queryParams,
  }) {
    // Check if the NavLink already has query parameters.
    bool hasQueryParams = api.contains('?');

    // Build the query parameters string from the map.
    String queryParamString = queryParams.entries
        .map((entry) => "${entry.key}=${entry.value}")
        .join('&');

    // Add the query parameters string to the NavLink.
    String updatedNavLink =
        hasQueryParams ? "$api&$queryParamString" : "$api?$queryParamString";

    return updatedNavLink;
  }

  Future<BaseNetworkResponse<T>> _parseResponse<T>({
    required ClientResponseModel response,
    required GenericNetworkCallBack<T> jsonParserCallBack,
    required String api,
  }) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        T parsedResponse = await compute(jsonParserCallBack, response.response);
        return BaseNetworkResponse<T>.success(
          statusCode: response.statusCode,
          data: parsedResponse,
        );
      } catch (e) {
        return BaseNetworkResponse<T>.failure(
          statusCode: response.statusCode,
          errorMessage: "Something went wrong. Please try again later.",
        );
      }
    } else {
      return BaseNetworkResponse<T>.failure(
        statusCode: response.statusCode,
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }
}
