class Log {
  int? id;
  int? x;
  int? y;
  int? w;
  int? h;
  String? image_url;
  String? drew_image_url;
  int? createdAt;
  // int? updatedAt;
  // int? eventId;
  // int? faceId;

  Log(
      {this.id,
      this.image_url,
      this.drew_image_url,
      // this.imageId,
      this.createdAt,
      this.x,
      this.y,
      this.w,
      this.h});

  Log.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image_url = json['image_url'];
    drew_image_url = json['drew_image_url'];
    createdAt = json['created_at'];
    x = json['x'];
    y = json['y'];
    w = json['w'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = image_url;
    data['drew_image_url'] = drew_image_url;
    data['created_at'] = createdAt;
    data['x'] = x;
    data['y'] = y;
    data['w'] = w;
    data['h'] = h;
    return data;
  }
}
