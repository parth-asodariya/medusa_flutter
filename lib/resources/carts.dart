import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class CartsResource extends BaseResource {
  CartsResource(super.client);

  /// Adds a shipping method to cart
  /// @param {string} cart_id Id of cart
  /// @param {StorePostCartsCartShippingMethodReq} payload Containing id of shipping option and optional data
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future addShippingMethod(
    String cartId,
    Map<String, dynamic>? req,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await client.post(
          '${client.options.baseUrl}/store/carts/$cartId/shipping-methods',
          data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Completes a cart.
  /// Payment authorization is attempted and if more work is required, we simply return the cart for further updates.
  /// If payment is authorized and order is not yet created, we make sure to do so.
  /// The completion of a cart can be performed idempotently with a provided header Idempotency-Key.
  /// If not provided, we will generate one for the request.
  /// @param {string} cart_id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCompleteCartRes>}
  Future complete(
    String cartId,
  ) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}/store/carts/$cartId/complete');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Creates a cart
  /// @param {StorePostCartReq} payload is optional and can contain a region_id and items.
  /// The cart will contain the payload, if provided. Otherwise it will be empty
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future create({Map<String, dynamic>? req}) async {
    try {
      final response =
          await client.post('${client.options.baseUrl}/store/carts', data: req);
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
