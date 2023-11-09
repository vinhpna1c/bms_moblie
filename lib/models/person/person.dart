class Person {
  int? personId;
  String? name;
  int? gender;
  int? dob;
  String? phone;
  String? avatarUrl;
  String? position;
  int? createdAt;
  int? updatedAt;

  Person(
      {this.personId,
      this.name,
      this.gender,
      this.dob,
      this.phone,
      this.avatarUrl,
      this.position,
      this.createdAt,
      this.updatedAt});

  Person.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    avatarUrl = json['avatar_url'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['name'] = name;
    data['gender'] = gender;
    data['dob'] = dob;
    data['phone'] = phone;
    data['avatar_url'] = avatarUrl;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
