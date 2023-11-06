import 'dart:async';

import 'package:bms_moblie/components/cards/device_card.dart';
import 'package:bms_moblie/controllers/device_ctrl.dart';
import 'package:bms_moblie/controllers/zone_ctrl.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/device/device.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/models/zone/zone.dart';
import 'package:bms_moblie/pages/devices/device_detail_page.dart';
import 'package:bms_moblie/pages/devices/device_view_all_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  RxList<Zone_> zones = <Zone_>[].obs;
  RxList<Device> devices = <Device>[].obs;

  @override
  void initState() {
    super.initState();
    ZoneController.getAllZone().then((data) {
      print(data);
      zones.clear();
      zones.addAll(data);
    });
    DeviceController.getAllDevice().then((data) {
      print(data);
      devices.clear();
      devices.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Devices',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => SingleChildScrollView(
                  child: Container(
                width: Get.size.width,
                constraints: BoxConstraints(
                  minHeight: Get.size.height - 100,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: zones.map((zone) {
                    final zone_cameras =
                        devices.where((camera) => camera.zoneId == zone.zoneId);
                    print(zone_cameras);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 16, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                zone.description ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () => Get.to(
                                  () => DeviceViewAllPage(
                                      devices: zone_cameras.toList()),
                                ),
                                child: const Text(
                                  'View All',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: zone_cameras
                              .map(
                                (camera) => GestureDetector(
                                  onTap: () => Get.to(
                                    () => DeviceDetailPage(
                                      device: camera,
                                      zone: zone,
                                    ),
                                  ),
                                  child: DeviceCard(
                                    cameraName: camera.name ?? '',
                                    zone: zone.description ?? '',
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    );
                  }).toList(),
                ),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
