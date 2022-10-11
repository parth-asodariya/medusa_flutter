import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class ReturnReasonsResource extends BaseResource {
  ReturnReasonsResource(super.client);

  /// @description Retrieves a single Return Reason
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnReasonsRes>}
  Future retrieve(String id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/return-reasons/$id',
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

  ///Lists return reasons defined in Medusa Admin
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnReasonsListRes>}

  Future list() async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/return-reasons',
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
}
