import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class PaymentMethodsResource extends BaseResource {
  PaymentMethodsResource(super.client);

  /// Lists customer payment methods
  /// @param {string} id id of cart
  /// @param customHeaders
  /// @return {StoreCustomersListPaymentMethodsRes}
  Future list() async {
    try {
      final response = await client
          .get('${client.options.baseUrl}/store/customers/me/payment-methods');
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
