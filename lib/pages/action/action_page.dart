import 'package:bms_moblie/components/cards/action_card.dart';
import 'package:bms_moblie/controllers/api/blob_ctrl.dart';
import 'package:bms_moblie/controllers/api/log_ctrl.dart';
import 'package:bms_moblie/controllers/api/zone_ctrl.dart';
import 'package:bms_moblie/controllers/data/zone_ctrl.d.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/log/log.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  RxList<Log> actions = <Log>[].obs;
  final zone_d_ctrl = ZoneDataController();

  @override
  void initState() {
    LogController.getAllLog().then((_logs) {
      actions.clear();
      actions.addAll(_logs);
    });
    ZoneController.getAllZone().then((_zones) {
      zone_d_ctrl.zones.clear();
      zone_d_ctrl.zones.addAll(_zones);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Actions',
              style: BMSTextStyles.pageTitle,
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Obx(
                () => Container(
                    width: Get.size.width,
                    constraints: BoxConstraints(
                      minHeight: Get.size.height - 100,
                    ),
                    color: Colors.white,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: actions.map((action) {
                        return ActionCard(
                          image:
                              BlobController.getUrlByID(action.imageId ?? ''),
                          uri: action.videoUrl ?? '',
                          time: DateFormat('').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  action.createdAt ?? 0)),
                          personName: action.faceId.toString(),
                          actions: 'check-in',
                          cameraName: action.faceId.toString(),
                        );
                      }).toList(),
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
