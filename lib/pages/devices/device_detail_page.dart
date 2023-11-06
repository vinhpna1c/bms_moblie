import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/layouts/single_route_layout.dart';
import 'package:bms_moblie/models/device/device.dart';
import 'package:bms_moblie/models/zone/zone.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../components/players/camera_player.dart';
import '../../components/players/ezviz_player.dart';

class DeviceDetailPage extends StatelessWidget {
  final Device? device;
  final Zone_? zone;
  const DeviceDetailPage({super.key, this.device, this.zone});

  @override
  Widget build(BuildContext context) {
    Widget player = Container();
    switch (device?.type) {
      case 1:
        player = CameraPlayer(
          rstpUrl: device?.connectUri ?? '',
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
                    device!.name ?? '',
                    style: BMSTextStyles.h3Text.copyWith(fontSize: 16),
                  ),
                  Text(
                    zone!.description ?? '',
                    style:
                        BMSTextStyles.h3Text.copyWith(color: Color(0xFF28AA73)),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Description: ',
                        style: BMSTextStyles.h3Text,
                      ),
                      Text(device!.description ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
