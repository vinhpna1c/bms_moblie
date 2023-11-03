import 'package:bms_moblie/components/cards/action_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

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
                    final zone_actions = actions
                        .where((action) => action['zoneId'] == zone['id']);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 16, right: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                zone['name'] as String,
                                style: BMSTextStyles.h1Text,
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
                            children: zone_actions.map((zone_action) {
                              final takeCams = cameras
                                  .where((camera) =>
                                      camera['id'] == zone_action['cameraId'])
                                  .toList();
                              return Wrap(
                                children: takeCams
                                    .map((takeCam) => ActionCard(
                                          uri: zone_action['uri'] as String,
                                          time: zone_action['time'] as String,
                                          personName: zone_action['peopleName']
                                              as String,
                                          actions:
                                              zone_action['type'] as String,
                                          cameraName: takeCam['name'] as String,
                                        ))
                                    .toList(),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
