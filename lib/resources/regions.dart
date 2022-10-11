import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class RegionsResource extends BaseResource {
  RegionsResource(super.client);

  /// @description Retrieves a list of regions
  /// @param customHeaders
  /// @return {ResponsePromise<StoreRegionsListRes>}
  Future list() async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/regions');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Retrieves a region
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreRegionsRes>}
  Future retrieve(String id) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/regions/$id',
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
