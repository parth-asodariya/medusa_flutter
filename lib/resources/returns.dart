import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class ReturnsResource extends BaseResource {
  ReturnsResource(super.client);

  /// Creates a return request
  /// @param {StorePostReturnsReq} payload details needed to create a return
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnsRes>}

  Future search(Map<String, dynamic>? req) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}`/store/returns', data: req);
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
