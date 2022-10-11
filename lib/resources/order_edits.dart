import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class OrderEditsResource extends BaseResource {
  OrderEditsResource(super.client);

  /// @description Retrieves a editing order
  /// @param {string} id of the order to be edited
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrderEditsRes>}
  Future retrieve(
    String id,
  ) async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/order-edits/$id');
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
