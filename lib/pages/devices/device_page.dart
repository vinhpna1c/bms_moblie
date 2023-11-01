import 'package:bms_moblie/components/cards/device_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Device Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: zones.map((zone) {
                  final zone_cameras =
                      cameras.where((camera) => camera['zoneId'] == zone['id']);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 16, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              zone['name'] as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: zone_cameras
                              .map(
                                (camera) => DeviceCard(
                                  cameraName: camera['name'] as String,
                                  zone: zone['name'] as String,
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            )),
          ),
        ],
      )),
    );
  }
}
