import 'package:medusa_flutter/models/store/order_edit.dart';

class StoreOrderEditsRes {
  OrderEdit? orderEdit;

  StoreOrderEditsRes.fromJson(json) {
    orderEdit = json["order_edit"] != null
        ? OrderEdit.fromJson(json["order_edit"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_edit'] = orderEdit?.toJson();
    return data;
  }
}
