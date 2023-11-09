class Log {
  int? id;
  String? videoUrl;
  String? imageId;
  int? createdAt;
  int? updatedAt;
  int? eventId;
  int? faceId;

  Log(
      {this.id,
      this.videoUrl,
      this.imageId,
      this.createdAt,
      this.updatedAt,
      this.eventId,
      this.faceId});

  Log.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['video_url'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eventId = json['event_id'];
    faceId = json['face_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_url'] = videoUrl;
    data['image_id'] = imageId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['event_id'] = eventId;
    data['face_id'] = faceId;
    return data;
  }
}
