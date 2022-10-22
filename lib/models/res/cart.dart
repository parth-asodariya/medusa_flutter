import '../store/cart.dart';
import '../store/order.dart';
import '../store/swap.dart';

class StoreCartsRes {
  Cart? cart;

  StoreCartsRes.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cart"] = cart?.toJson();
    return data;
  }
}

class StoreCompleteCartRes {
  Cart? cart;
  Order? order;
  Swap? swap;
  String? type;

  StoreCompleteCartRes.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    if (type != null && json.containsKey("data")) {
      if (type == "cart") {
        cart = Cart.fromJson(json["data"]);
      }
      if (type == "order") {
        order = Order.fromJson(json["data"]);
      }
      if (type == "swap") {
        swap = Swap.fromJson(json["swap"]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) data["data"] = cart?.toJson();
    if (order != null) data["data"] = order?.toJson();
    if (swap != null) data["data"] = swap?.toJson();
    return data;
  }
}
