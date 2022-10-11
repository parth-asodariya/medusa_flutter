import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class OrdersResource extends BaseResource {
  OrdersResource(super.client);

  /// @description Retrieves an order
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future retrieve(
    String id,
  ) async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/orders/$id');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Retrieves an order by cart id
  /// @param {string} cart_id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future retrieveByCartId(
    String cartId,
  ) async {
    try {
      final response = await client
          .get('${client.options.baseUrl}/store/orders/cart/$cartId');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Look up an order using order details
  /// @param {StoreGetOrdersParams} payload details used to look up the order
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrdersRes>}
  Future lookupOrder(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await client.get(
          '${client.options.baseUrl}/store/orders/cart/',
          queryParameters: queryParams);
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
