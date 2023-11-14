class Camera {
  int? id;
  String? name;
  String? description;
  String? connectUri;
  String? placeholderUrl;
  int? type;
  int? createdAt;
  int? updatedAt;
  int? zoneId;

  Camera(
      {this.id,
      this.name,
      this.description,
      this.connectUri,
      this.placeholderUrl,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.zoneId});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    connectUri = json['connect_uri'];
    placeholderUrl = json['placeholder_url'];
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
    data['placeholder_url'] = placeholderUrl;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['zone_id'] = zoneId;
    return data;
  }
}
