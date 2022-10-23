import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/collections.dart';

class CollectionsResource extends BaseResource {
  CollectionsResource(super.client);

  /// @description Retrieves a single collection
  /// @param {string} id id of the collection
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCollectionsRes>}
  Future<StoreCollectionsRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('/store/collections/$id');
      if (response.statusCode == 200) {
        return StoreCollectionsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a list of collections
  /// @param {string} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCollectionsListRes>}
  Future<StoreCollectionsListRes?> list(
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/collections',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return StoreCollectionsListRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
