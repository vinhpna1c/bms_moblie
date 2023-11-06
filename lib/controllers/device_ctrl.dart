import 'package:bms_moblie/controllers/api.dart';
import 'package:bms_moblie/models/device/device.dart';

class DeviceController {
  static final CAMERA_PATH = '/camera';

  static Future<List<Device>> getAllDevice() async {
    List<Device> devices = [];
    final respond = await BMS_Api.get(CAMERA_PATH);
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var device in data) {
        devices.add(Device.fromJson(device));
      }
    }
    return devices;
  }

  static Future<Device?> getDeviceDetail(String id) async {
    final respond = await BMS_Api.get('$CAMERA_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Device.fromJson(data);
    }
    return null;
  }
}
