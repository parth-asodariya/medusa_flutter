import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/req/store_post_customers_customer_password_token_req.dart';
import '../models/req/store_post_customers_customer_req.dart';
import '../models/req/store_post_customers_req.dart';
import '../models/res/customers.dart';

class CustomersResource extends BaseResource {
  CustomersResource(super.client);

  /// Creates a customer
  /// @param {StorePostCustomersReq} payload information of customer
  /// @param customHeaders
  /// @return { ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> create(
      {StorePostCustomersReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client
          .post('/store/customers', data: req);
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  ///Retrieves the customer that is currently logged
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> retrieve(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/customers/me',
      );
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Updates a customer
  /// @param {StorePostCustomersCustomerReq} payload information to update customer with
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> update(
      {StorePostCustomersCustomerReq? req,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client
          .post('/store/customers/me', data: req);
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// Retrieve customer orders
  /// @param {StoreGetCustomersCustomerOrdersParams} params optional params to retrieve orders
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersListOrdersRes>}

  Future<StoreCustomersListOrdersRes?> listOrders(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/customers/me/orders',
      );
      if (response.statusCode == 200) {
        return StoreCustomersListOrdersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// Resets customer password
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to reset customer password
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> resetPassword(
      {StorePostCustomersCustomerPasswordTokenReq? req,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post(
          '/store/customers/password-reset',
          data: req);
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  /// Generates a reset password token, which can be used to reset the password.
  /// The token is not returned but should be sent out to the customer in an email.
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to generate token
  /// @param customHeaders
  /// @return {ResponsePromise}
  Future generatePasswordToken(
      {StorePostCustomersCustomerPasswordTokenReq? req,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post(
          '/store/customers/password-token',
          data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
