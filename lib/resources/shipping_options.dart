import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class ShippingOptionsResource extends BaseResource {
  ShippingOptionsResource(super.client);

  /// @description Lists shiping options available for a cart
  /// @param {string} cart_id
  /// @param customHeaders
  /// @return {ResponsePromise<StoreShippingOptionsListRes>}
  Future listCartOptions(String cart_id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/shipping-options/$cart_id',
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

  /// @description Lists shiping options available
  /// @param {StoreGetShippingOptionsParams} query
  /// @param customHeaders
  /// @return {ResponsePromise<StoreShippingOptionsListRes>}
  Future list({Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(
          '${client.options.baseUrl}/store/shipping-options',
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
