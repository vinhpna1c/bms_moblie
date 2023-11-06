import 'dart:math';

int getMaxDeviceOnPage(int deviceLength) {
  return pow(2, sqrt(deviceLength).floor() + 1).toInt();
}
