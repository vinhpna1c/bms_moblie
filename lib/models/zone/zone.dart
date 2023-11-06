// ignore: camel_case_types
class Zone_ {
  int? zoneId;
  String? description;
  int? createdAt;
  int? updatedAt;

  Zone_({this.zoneId, this.description, this.createdAt, this.updatedAt});

  Zone_.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zone_id'] = zoneId;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
