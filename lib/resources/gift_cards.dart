import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

class GiftCardsResource extends BaseResource {
  GiftCardsResource(super.client);

  /// @description Retrieves a single GiftCard
  /// @param {string} code code of the gift card
  /// @param customHeaders
  /// @return {ResponsePromise<StoreGiftCardsRes>}
  Future retrieve(String code) async {
    try {
      final response =
          await client.get('${client.options.baseUrl}/store/gift-cards/$code');
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
