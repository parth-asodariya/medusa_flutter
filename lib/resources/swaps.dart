import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/swaps.dart';

class SwapsResource extends BaseResource {
  SwapsResource(super.client);

  /// @description Creates a swap from a cart
  /// @param {StorePostSwapsReq} payload
  /// @param customHeaders
  /// @return {ResponsePromise<StoreSwapsRes>}
  Future<StoreSwapsRes?> create(Map<String, dynamic>? req) async {
    try {
      final response =
          await client.post('${client.options.baseUrl}/store/swaps', data: req);
      if (response.statusCode == 200) {
        return StoreSwapsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// @description Retrieves a swap by cart id
  /// @param {string} cart_id id of cart
  /// @param customHeaders
  /// @return {ResponsePromise<StoreSwapsRes>}
  Future<StoreSwapsRes?> retrieveByCartId(String cart_id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/swaps/$cart_id',
      );
      if (response.statusCode == 200) {
        return StoreSwapsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
