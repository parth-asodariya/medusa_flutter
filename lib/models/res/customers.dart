import 'package:medusa_flutter/models/res/common.dart';
import 'package:medusa_flutter/models/store/customer.dart';
import 'package:medusa_flutter/models/store/order.dart';

class StoreCustomersRes {
  Customer? customer;

  StoreCustomersRes.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json["customer"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (customer != null) {
      data['customer'] = customer;
    }
    return data;
  }
}

class StoreCustomersListOrdersRes extends PaginatedResponse {
  List<Order>? orders;

  StoreCustomersListOrdersRes.fromJson(json) : super.fromJson(json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders?.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders'] = orders?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}
