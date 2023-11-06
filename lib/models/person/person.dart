class Person {
  int? personId;
  String? name;
  int? gender;
  int? dob;
  String? phone;
  int? createdAt;
  int? updatedAt;

  Person(
      {this.personId,
      this.name,
      this.gender,
      this.dob,
      this.phone,
      this.createdAt,
      this.updatedAt});

  Person.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
