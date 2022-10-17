class StorePostCartsCartPaymentSessionReq {
  String? provider_id;

  StorePostCartsCartPaymentSessionReq({
    required this.provider_id,
  });

  StorePostCartsCartPaymentSessionReq.fromJson(Map<String, dynamic> json) {
    provider_id = json['provider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = this.provider_id;
    return data;
  }
}
