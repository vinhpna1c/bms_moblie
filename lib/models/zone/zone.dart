class Zone_ {
  int? zoneId;
  String? name;
  String? description;
  String? placeholderUrl;
  int? createdAt;
  int? updatedAt;

  Zone_(
      {this.zoneId,
      this.name,
      this.description,
      this.placeholderUrl,
      this.createdAt,
      this.updatedAt});

  Zone_.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'];
    name = json['name'];
    description = json['description'];
    placeholderUrl = json['placeholder_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zone_id'] = zoneId;
    data['name'] = name;
    data['description'] = description;
    data['placeholder_url'] = placeholderUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
