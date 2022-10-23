import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/regions.dart';

class RegionsResource extends BaseResource {
  RegionsResource(super.client);

  /// @description Retrieves a list of regions
  /// @param customHeaders
  /// @return {ResponsePromise<StoreRegionsListRes>}
  Future<StoreRegionsListRes?> list(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('${client.options.baseUrl}/store/regions');
      if (response.statusCode == 200) {
        return StoreRegionsListRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a region
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreRegionsRes>}
  Future<StoreRegionsRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '${client.options.baseUrl}/store/regions/$id',
      );
      if (response.statusCode == 200) {
        return StoreRegionsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
