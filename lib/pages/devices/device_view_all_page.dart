import 'package:bms_moblie/components/players/camera_player.dart';
import 'package:bms_moblie/components/players/ezviz_player.dart';
import 'package:bms_moblie/layouts/single_route_layout.dart';
import 'package:bms_moblie/models/device/camera.dart';
import 'package:bms_moblie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceViewAllPage extends StatelessWidget {
  final List<Camera> devices;
  const DeviceViewAllPage({
    super.key,
    this.devices = const <Camera>[],
  });

  @override
  Widget build(BuildContext context) {
    int maxDevices = getMaxDeviceOnPage(devices.length);
    int emptyCell = maxDevices - devices.length;

    return SingleRouteLayout(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight:
                        maxDevices * (Get.size.width / 2 / 4 * 3) / 2 + 200),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    ...devices.map((device) {
                      return AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: device.type == 1
                              ? CameraPlayer(rstpUrl: device.connectUri ?? '')
                              : EzvizPlayer(),
                        ),
                      );
                    }),
                    ...List.generate(
                      emptyCell,
                      (index) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            color: Colors.grey,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
