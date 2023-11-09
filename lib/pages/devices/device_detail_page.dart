import 'dart:async';

import 'package:bms_moblie/controllers/api/blob_ctrl.dart';
import 'package:bms_moblie/controllers/api/log_ctrl.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/layouts/single_route_layout.dart';
import 'package:bms_moblie/models/device/camera.dart';
import 'package:bms_moblie/models/log/log.dart';
import 'package:bms_moblie/models/zone/zone.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/players/camera_player.dart';
import '../../components/players/ezviz_player.dart';

class DeviceDetailPage extends StatefulWidget {
  final Camera? device;
  final Zone_? zone;
  const DeviceDetailPage({super.key, this.device, this.zone});

  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

// ignore: constant_identifier_names
const int INTERVAL_DURATION = 2500;

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  RxList<Log> logs = <Log>[].obs;
  Timer? _timer;

  void fetchLog() async {
    final allLogs = await LogController.getAllLog();
    allLogs.sort((l1, l2) => (l2.createdAt ?? 0) - (l1.createdAt ?? 0));
    print("Data fetch: ${allLogs.length}");
    logs.clear();
    logs.addAll(allLogs);
  }

  @override
  void initState() {
    if ((widget.device?.name ?? '').contains('Hanet')) {
      _timer = Timer.periodic(const Duration(milliseconds: INTERVAL_DURATION),
          (timer) {
        fetchLog();
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget player = Container();
    switch (widget.device?.type) {
      case 1:
        player = CameraPlayer(
          rstpUrl: widget.device?.connectUri ?? '',
        );
        break;
      case 2:
        player = EzvizPlayer();
        break;
      default:
        break;
    }

    return SingleRouteLayout(
      body: PageContainer(
          child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Devices',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(color: Colors.white, child: player),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.device!.name ?? '',
                    style: BMSTextStyles.h3Text.copyWith(fontSize: 16),
                  ),
                  Text(
                    widget.device!.description ?? '',
                    style:
                        BMSTextStyles.h3Text.copyWith(color: Color(0xFF28AA73)),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Description: ',
                        style: BMSTextStyles.h3Text,
                      ),
                      Text(widget.device!.description ?? ''),
                    ],
                  ),
                  const Text(
                    'Recently detected',
                    style: BMSTextStyles.h1Text,
                  ),
                  Obx(
                    () => Container(
                      constraints: const BoxConstraints(maxHeight: 170),
                      color: Colors.black,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: logs
                            .map(
                              (element) => Container(
                                height: 150,
                                width: 200,
                                margin: EdgeInsets.only(right: 16),
                                child: Image.network(
                                  BlobController.getUrlByID(
                                      element.imageId ?? ''),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
