import 'package:bms_moblie/controllers/api/api.dart';
import 'package:bms_moblie/models/face/face.dart';

class FaceController {
  // ignore: constant_identifier_names
  static const ZONE_PATH = '/face';

  static Future<List<Face>> getAllFace() async {
    List<Face> faces = [];
    final respond = await BMS_Api.get(ZONE_PATH);
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var face in data) {
        faces.add(Face.fromJson(face));
      }
    }

    return faces;
  }

  static Future<Face?> getFaceByID(String id) async {
    final respond = await BMS_Api.get('$ZONE_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Face.fromJson(data);
    }

    return null;
  }
}
