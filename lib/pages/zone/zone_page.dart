import 'package:bms_moblie/components/cards/zone_card.dart';
import 'package:bms_moblie/controllers/api/zone_ctrl.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/zone/zone.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:bms_moblie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZonePage extends StatefulWidget {
  const ZonePage({super.key});

  @override
  State<ZonePage> createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  RxList<Zone_> zones = <Zone_>[].obs;

  @override
  void initState() {
    fetchZones();
    super.initState();
  }

  void fetchZones() async {
    final allZones = await ZoneController.getAllZone();
    zones.clear();
    zones.addAll(allZones);
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Zones',
              style: BMSTextStyles.pageTitle,
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
                    children: [
                      Center(
                        child: Obx(
                          () => Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: zones
                                .map((zone) => ZoneCard(
                                      avatar: handleImagePathServer(
                                          zone.placeholderUrl ?? ''),
                                      zoneName: zone.name ?? '',
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
