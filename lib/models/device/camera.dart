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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['connect_uri'] = this.connectUri;
    data['placeholder_url'] = this.placeholderUrl;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['zone_id'] = this.zoneId;
    return data;
  }
}
