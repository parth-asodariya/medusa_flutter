class StoreCustomersListPaymentMethodsRes {
  List<PaymentMethod>? paymentMethods;

  StoreCustomersListPaymentMethodsRes.fromJson(json) {
    if (json['payment_methods'] != null) {
      paymentMethods = <PaymentMethod>[];
      json['payment_methods'].forEach((v) {
        paymentMethods?.add(PaymentMethod.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_methods'] =
        paymentMethods?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}

class PaymentMethod {
  String? providerId;
  Map<String, dynamic>? data;

  PaymentMethod.fromJson(json) {
    providerId = json["provider_id"];
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = providerId;
    data['data'] = data;
    return data;
  }
}
