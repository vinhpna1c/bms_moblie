import 'package:bms_moblie/controllers/api.dart';
import 'package:bms_moblie/models/person/person.dart';
import 'package:bms_moblie/models/zone/zone.dart';

class PeopleController {
  // ignore: constant_identifier_names
  static const PEOPLE_PATH = '/people';

  static Future<List<Person>> getAllPeople() async {
    List<Person> people = [];
    final respond = await BMS_Api.get(PEOPLE_PATH);
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var person in data) {
        people.add(Person.fromJson(person));
      }
    }

    return people;
  }

  static Future<Person?> getPeopleByID(String id) async {
    final respond = await BMS_Api.get('$PEOPLE_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Person.fromJson(data);
    }

    return null;
  }

  static Future<Person?> createNewPerson({
    String name = '',
    bool gender = true,
    DateTime? dob,
    String? phone,
  }) async {
    final respond = await BMS_Api.post(PEOPLE_PATH, data: {
      name: name,
      gender: gender ? 1 : 0,
      dob: dob,
      phone: phone,
    });
    if (respond.statusCode == 201) {
      return Person.fromJson(respond.data);
    }
    return null;
  }
}
