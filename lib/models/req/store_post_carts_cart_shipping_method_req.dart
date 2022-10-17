class StorePostCartsCartShippingMethodReq {
  String? option_id;
  Map<String, dynamic>? data;

  StorePostCartsCartShippingMethodReq({
    required this.option_id,
    this.data,
  });

  StorePostCartsCartShippingMethodReq.fromJson(Map<String, dynamic> json) {
    option_id = json['option_id'];
    data = json['data'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.option_id;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
