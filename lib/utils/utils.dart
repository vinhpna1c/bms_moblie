import 'dart:math';

import 'package:bms_moblie/controllers/api/blob_ctrl.dart';

int getMaxDeviceOnPage(int deviceLength) {
  return pow(2, sqrt(deviceLength).floor() + 1).toInt();
}

// path from server can be url or id in blob server
String handleImagePathServer(String path) {
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return path;
  }
  return BlobController.getUrlByID(path);
}
