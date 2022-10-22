import '../store/region.dart';

class StoreRegionsListRes {
  List<Region>? regions;

  StoreRegionsListRes.fromJson(json) {
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((v) {
        regions?.add(Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regions'] = regions?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}

class StoreRegionsRes {
  Region? region;

  StoreRegionsRes.fromJson(json) {
    region = json["region"] != null ? Region.fromJson(json["region"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = region?.toJson();
    return data;
  }
}
