import 'package:medusa_flutter/models/res/common.dart';

import '../store/product.dart';

class StoreProductsListRes extends PaginatedResponse {
  List<Product>? products;

  StoreProductsListRes.fromJson(json) : super.fromJson(json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['products'] = products?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}

class StoreProductsRes {
  Product? product;

  StoreProductsRes.fromJson(json) {
    product =
        json["product"] != null ? Product.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = product?.toJson();
    return data;
  }
}

class StorePostSearchRes {
  List<dynamic>? hits;

  StorePostSearchRes.fromJson(json) {
    if (json['hits'] != null) {
      hits = json['hits'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hits'] = hits;
    return data;
  }
}
