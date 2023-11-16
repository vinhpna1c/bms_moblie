import 'package:bms_moblie/components/cards/device_card.dart';
import 'package:bms_moblie/controllers/data/zone_ctrl.d.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/device/camera.dart';
import 'package:bms_moblie/models/zone/zone.dart';
import 'package:bms_moblie/pages/devices/device_detail_page.dart';
import 'package:bms_moblie/pages/devices/device_view_all_page.dart';
import 'package:bms_moblie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/api/device_ctrl.dart';
import '../../controllers/api/zone_ctrl.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  RxList<Camera> devices = <Camera>[].obs;
  RxBool isLoading = false.obs;
  final zoneController = Get.put(ZoneDataController());

  void fetchData() async {
    isLoading.value = true;

    // get zone data before get deivce data
    ZoneController.getAllZone().then((data) {
      zoneController.zones.clear();
      zoneController.zones.addAll(data);
    });

    DeviceController.getAllDevice().then((data) {
      devices.clear();
      devices.addAll(data);

      isLoading.value = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Obx(
        () => isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : PageContainer(
                child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Devices',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Container(
                        width: Get.size.width,
                        constraints: BoxConstraints(
                          minHeight: Get.size.height - 100,
                        ),
                        color: Colors.white,
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: zoneController.zones.map((zone) {
                              final zoneCameras = devices.where(
                                  (camera) => camera.zoneId == zone.zoneId);

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 16, right: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          zone.description ?? '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        TextButton(
                                          onPressed: () => Get.to(
                                            () => DeviceViewAllPage(
                                                devices: zoneCameras.toList()),
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
                                    children: zoneCameras
                                        .map(
                                          (camera) => GestureDetector(
                                            onTap: () => Get.to(
                                              () => DeviceDetailPage(
                                                device: camera,
                                                zone: zone,
                                              ),
                                            ),
                                            child: DeviceCard(
                                              placeholderUrl:
                                                  handleImagePathServer(
                                                      camera.placeholderUrl ??
                                                          ''),
                                              cameraName: camera.name ?? '',
                                              zone: zone.name ?? '',
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
