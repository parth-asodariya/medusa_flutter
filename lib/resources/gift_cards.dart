import 'dart:developer';

import 'package:medusa_flutter/resources/base.dart';

import '../models/res/gift_cards.dart';

class GiftCardsResource extends BaseResource {
  GiftCardsResource(super.client);

  /// @description Retrieves a single GiftCard
  /// @param {string} code code of the gift card
  /// @param customHeaders
  /// @return {ResponsePromise<StoreGiftCardsRes>}
  Future<StoreGiftCardsRes?> retrieve(
      {required String code, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('${client.options.baseUrl}/store/gift-cards/$code');
      if (response.statusCode == 200) {
        return StoreGiftCardsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
