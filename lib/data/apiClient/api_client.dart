import 'dart:developer';

import 'package:dio/dio.dart';

class ApiClient {
  String? baseUrl;
  num? maxRetries;
  String? apiKey;

  ApiClient(this.baseUrl, this.maxRetries, {this.apiKey});

  var commonHeaders = {
    'content-type': 'application/json'
    // other headers
  };

  final _dio = Dio();

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future fetchListOfProduct(Map<String, dynamic>? queryParams) async {
    try {
      final response = await _dio.get(
        '$baseUrl/store/products',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Retrieves a single Product
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsRes>}
  Future retrieveProductFromId(String id) async {
    try {
      final response = await _dio.get(
        '$baseUrl/store/products/$id',
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Searches for products
  /// @param {StorePostSearchReq} searchOptions is required
  /// @param customHeaders
  /// @return {ResponsePromise<StorePostSearchRes>}
  Future searchProduct(Map<String, dynamic>? req) async {
    try {
      final response =
          await _dio.post('$baseUrl/store/products/search', data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
