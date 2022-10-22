import 'dart:developer';

import 'package:medusa_flutter/models/req/store_post_search_req.dart';
import 'package:medusa_flutter/resources/base.dart';

import '../models/res/products.dart';

class ProductsResource extends BaseResource {
  ProductsResource(super.client);

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future<StoreProductsListRes?> list(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/products',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return StoreProductsListRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// @description Retrieves a single Product
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsRes>}
  Future<StoreProductsRes?> retrieve(String id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/products/$id',
      );
      if (response.statusCode == 200) {
        return StoreProductsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// @description Searches for products
  /// @param {StorePostSearchReq} searchOptions is required
  /// @param customHeaders
  /// @return {ResponsePromise<StorePostSearchRes>}
  Future<StorePostSearchRes?> search(StorePostSearchReq? req) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}/store/products/search', data: req);
      if (response.statusCode == 200) {
        return StorePostSearchRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
