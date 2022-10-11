import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class CustomersResource extends BaseResource {
  CustomersResource(super.client);

  /// Creates a customer
  /// @param {StorePostCustomersReq} payload information of customer
  /// @param customHeaders
  /// @return { ResponsePromise<StoreCustomersRes>}
  Future create(Map<String, dynamic>? req) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}/store/customers', data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  ///Retrieves the customer that is currently logged
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future retrieve() async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/customers/me',
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

  /// Updates a customer
  /// @param {StorePostCustomersCustomerReq} payload information to update customer with
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future update(Map<String, dynamic>? req) async {
    try {
      final response = await client
          .post('${client.options.baseUrl}/store/customers/me', data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Retrieve customer orders
  /// @param {StoreGetCustomersCustomerOrdersParams} params optional params to retrieve orders
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersListOrdersRes>}

  Future listOrders() async {
    try {
      final response = await client.get(
        '${client.options.baseUrl}/store/customers/me/orders',
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

  /// Resets customer password
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to reset customer password
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future resetPassword(Map<String, dynamic>? req) async {
    try {
      final response = await client.post(
          '${client.options.baseUrl}/store/customers/password-reset',
          data: req);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Generates a reset password token, which can be used to reset the password.
  /// The token is not returned but should be sent out to the customer in an email.
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to generate token
  /// @param customHeaders
  /// @return {ResponsePromise}
  Future generatePasswordToken(Map<String, dynamic>? req) async {
    try {
      final response = await client.post(
          '${client.options.baseUrl}/store/customers/password-token',
          data: req);
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
