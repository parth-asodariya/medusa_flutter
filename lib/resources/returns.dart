import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/returns.dart';

class ReturnsResource extends BaseResource {
  ReturnsResource(super.client);

  /// Creates a return request
  /// @param {StorePostReturnsReq} payload details needed to create a return
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnsRes>}

  Future<StoreReturnsRes?> search(Map<String, dynamic>? req) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}`/store/returns', data: req);
      if (response.statusCode == 200) {
        return StoreReturnsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
