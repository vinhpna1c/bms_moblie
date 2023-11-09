import 'package:bms_moblie/controllers/api/api.dart';
import 'package:bms_moblie/models/device/camera.dart';

class DeviceController {
  static final CAMERA_PATH = '/camera';

  static Future<List<Camera>> getAllDevice() async {
    List<Camera> devices = [];
    final respond = await BMS_Api.get(CAMERA_PATH);
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var device in data) {
        devices.add(Camera.fromJson(device));
      }
    }
    return devices;
  }

  static Future<Camera?> getDeviceDetail(String id) async {
    final respond = await BMS_Api.get('$CAMERA_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Camera.fromJson(data);
    }
    return null;
  }
}
