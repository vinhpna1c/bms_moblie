class Device {
  int? id;
  String? name;
  String? description;
  String? connectUri;
  int? type;
  int? createdAt;
  int? updatedAt;
  int? zoneId;

  Device(
      {this.id,
      this.name,
      this.description,
      this.connectUri,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.zoneId});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    connectUri = json['connect_uri'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['connect_uri'] = connectUri;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['zone_id'] = zoneId;
    return data;
  }
}
