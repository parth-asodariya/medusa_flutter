import 'package:medusa_flutter/models/store/shipping_option.dart';

class StoreShippingOptionsListRes {
  List<ShippingOption>? shippingOptions;

  StoreShippingOptionsListRes.fromJson(json) {
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['shipping_options'].forEach((v) {
        shippingOptions?.add(ShippingOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_options'] =
        shippingOptions?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}
