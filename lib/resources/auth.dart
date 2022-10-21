import 'dart:developer';

import 'package:medusa_flutter/models/res/auth.dart';
import 'package:medusa_flutter/resources/base.dart';

import '../models/res/auth.dart';

class AuthResource extends BaseResource {
  AuthResource(super.client);

  /// @description Authenticates a customer using email and password combination
  /// @param {StorePostAuthReq} payload authentication payload
  /// @param customHeaders
  /// @return {ResponsePromise<StoreAuthRes>}
  Future<StoreAuthRes?> authenticate(Map<String, dynamic>? req) async {
    try {
      final response =
          await client.post('${client.options.baseUrl}/store/auth', data: req);
      if (response.statusCode == 200) {
        return StoreAuthRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// @description Removes authentication session
  /// @return {ResponsePromise<void>}
  Future deleteSession() async {
    try {
      final response = await client.delete(
        '${client.options.baseUrl}/store/auth',
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

  /// @description Retrieves an authenticated session
  /// Usually used to check if authenticated session is alive.
  /// @param customHeaders
  /// @return {ResponsePromise<StoreAuthRes>}
  Future<StoreAuthRes?> getSession() async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/auth',
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

  /// @description Check if email exists
  /// @param {string} email is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreGetAuthEmailRes>}
  Future<StoreGetAuthEmailRes?> exists(String email) async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/auth/$email',
      );
      if (response.statusCode == 200) {
        return StoreGetAuthEmailRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
