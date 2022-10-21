import 'package:medusa_flutter/models/store/customer.dart';

class StoreAuthRes {
  Customer? customer;

  StoreAuthRes({this.customer});

  StoreAuthRes.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["customer"] = customer?.toJson();
    return data;
  }
}

class StoreGetAuthEmailRes {
  bool exists = false;

  StoreGetAuthEmailRes({this.exists = false});

  StoreGetAuthEmailRes.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['exists'] = exists;
    return data;
  }
}
