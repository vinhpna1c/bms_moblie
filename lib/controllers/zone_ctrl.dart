import 'package:bms_moblie/controllers/api.dart';
import 'package:bms_moblie/models/zone/zone.dart';

class ZoneController {
  // ignore: constant_identifier_names
  static const ZONE_PATH = '/zone';

  static Future<List<Zone_>> getAllZone() async {
    List<Zone_> zones = [];
    final respond = await BMS_Api.get(ZONE_PATH);
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var zone in data) {
        zones.add(Zone_.fromJson(zone));
      }
    }

    return zones;
  }

  static Future<Zone_?> getAllZoneByID(String id) async {
    final respond = await BMS_Api.get('$ZONE_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Zone_.fromJson(data);
    }

    return null;
  }
}
