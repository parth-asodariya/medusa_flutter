import 'package:medusa_flutter/models/store/gift_card.dart';

class StoreGiftCardsRes {
  GiftCard? giftCard;

  StoreGiftCardsRes.fromJson(json) {
    giftCard =
        json["gift_card"] != null ? GiftCard.fromJson(json["gift_card"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["gift_card"] = giftCard?.toJson();
    return data;
  }
}
