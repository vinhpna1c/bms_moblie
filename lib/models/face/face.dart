class Face {
  int? faceId;
  String? frameFilePath;
  double? x;
  double? y;
  int? width;
  int? height;
  int? createdAt;
  int? updatedAt;
  int? personId;

  Face(
      {this.faceId,
      this.frameFilePath,
      this.x,
      this.y,
      this.width,
      this.height,
      this.createdAt,
      this.updatedAt,
      this.personId});

  Face.fromJson(Map<String, dynamic> json) {
    faceId = json['face_id'];
    frameFilePath = json['FrameFilePath'];
    x = json['X'];
    y = json['Y'];
    width = json['Width'];
    height = json['Height'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    personId = json['person_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['face_id'] = faceId;
    data['FrameFilePath'] = frameFilePath;
    data['X'] = x;
    data['Y'] = y;
    data['Width'] = width;
    data['Height'] = height;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['person_id'] = personId;
    return data;
  }
}
