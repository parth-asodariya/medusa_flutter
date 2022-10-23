import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/orders.dart';

class OrdersResource extends BaseResource {
  OrdersResource(super.client);

  /// @description Retrieves an order
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future<StoreOrdersRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('${client.options.baseUrl}/store/orders/$id');
      if (response.statusCode == 200) {
        return StoreOrdersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves an order by cart id
  /// @param {string} cart_id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future<StoreOrdersRes?> retrieveByCartId(
      {required String cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client
          .get('${client.options.baseUrl}/store/orders/cart/$cartId');
      if (response.statusCode == 200) {
        return StoreOrdersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// @description Look up an order using order details
  /// @param {StoreGetOrdersParams} payload details used to look up the order
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future<StoreOrdersRes?> lookupOrder(
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
          '${client.options.baseUrl}/store/orders/cart/',
          queryParameters: queryParams);
      if (response.statusCode == 200) {
        return StoreOrdersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
