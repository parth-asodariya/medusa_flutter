import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/shipping_options.dart';

class ShippingOptionsResource extends BaseResource {
  ShippingOptionsResource(super.client);

  /// @description Lists shiping options available for a cart
  /// @param {string} cart_id
  /// @param customHeaders
  /// @return {ResponsePromise<StoreShippingOptionsListRes>}
  Future<StoreShippingOptionsListRes?> listCartOptions(
      {String? cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/shipping-options/$cartId',
      );
      if (response.statusCode == 200) {
        return StoreShippingOptionsListRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// @description Lists shiping options available
  /// @param {StoreGetShippingOptionsParams} query
  /// @param customHeaders
  /// @return {ResponsePromise<StoreShippingOptionsListRes>}
  Future<StoreShippingOptionsListRes?> list(
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
          '/store/shipping-options',
          queryParameters: queryParams);
      if (response.statusCode == 200) {
        return StoreShippingOptionsListRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
