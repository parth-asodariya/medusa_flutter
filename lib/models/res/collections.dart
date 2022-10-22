import 'package:medusa_flutter/models/res/common.dart';

import '../store/product_collection.dart';

class StoreCollectionsRes {
  ProductCollection? collection;

  StoreCollectionsRes.fromJson(Map<String, dynamic> json) {
    collection = json['collection'] != null
        ? ProductCollection.fromJson(json["collection"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (collection != null) {
      data['collection'] = collection?.toJson();
    }
    return data;
  }
}

class StoreCollectionsListRes extends PaginatedResponse {
  List<ProductCollection>? collections;

  StoreCollectionsListRes.fromJson(json) : super.fromJson(json) {
    if (json['collections'] != null) {
      collections = <ProductCollection>[];
      json['collections'].forEach((v) {
        collections?.add(ProductCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collections'] = collections?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}
