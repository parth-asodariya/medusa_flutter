import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class ProductsResource extends BaseResource {
  ProductsResource(super.client);

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future list({Map<String, dynamic>? queryParams,}) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/products',
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
  Future retrieve(String id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/products/$id',
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
  Future search(Map<String, dynamic>? req) async {
    try {
      final response =
      await client.post('${client.options.baseUrl}/store/products/search', data: req);
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
