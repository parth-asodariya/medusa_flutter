import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class CollectionsResource extends BaseResource {
  CollectionsResource(super.client);

  /// @description Retrieves a single collection
  /// @param {string} id id of the collection
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCollectionsRes>}
  Future retrieve(
    String id,
  ) async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/collections/$id');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// @description Retrieves a list of collections
  /// @param {string} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCollectionsListRes>}
  Future list({
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/collections',
        queryParameters: queryParams,
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
