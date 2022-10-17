import 'package:medusa_flutter/models/req/item.dart';

class StorePostCartReq {
  ///TODO: FeatureFlagDecorators implementation remaining

  String? region_id;
  String? country_code;
  List<Item>? items;
  dynamic context;
  String? sales_channel_id;

  StorePostCartReq({
    this.region_id,
    this.country_code,
    this.items,
    this.context,
    this.sales_channel_id,
  });

  StorePostCartReq.fromJson(Map<String, dynamic> json) {
    region_id = json['region_id'];
    country_code = json['country_code'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(new Item.fromJson(v));
      });
    }
    context = json['context'] != null ? json['context'] : null;
    sales_channel_id = json['sales_channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_id'] = this.region_id;
    data['country_code'] = this.country_code;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    data['sales_channel_id'] = this.sales_channel_id;
    return data;
  }
}
