import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/order_edits.dart';

class OrderEditsResource extends BaseResource {
  OrderEditsResource(super.client);

  /// @description Retrieves a editing order
  /// @param {string} id of the order to be edited
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrderEditsRes>}
  Future<StoreOrderEditsRes?> retrieve(
    String id,
  ) async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/order-edits/$id');
      if (response.statusCode == 200) {
        return StoreOrderEditsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
