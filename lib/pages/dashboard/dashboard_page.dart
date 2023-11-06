import 'package:bms_moblie/components/cards/chart.dart';
import 'package:bms_moblie/components/cards/dashboard_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 16, right: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recently Detected Faces",
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
                              children: recentDetecteds.map((recent) {
                                final takeCams = cameras
                                    .where((cam) =>
                                        cam['id'] == recent['cameraId'])
                                    .toList();
                                return Wrap(
                                  children: takeCams
                                      .map((takeCam) => DashboardCard(
                                            uri: recent['uri'] as String,
                                            time: recent['time'] as String,
                                            personName:
                                                recent['peopleName'] as String,
                                            cameraName:
                                                takeCam['name'] as String,
                                          ))
                                      .toList(),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 16, right: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Activity Log",
                                  style: BMSTextStyles.h1Text,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 12.0, top: 8.0, bottom: 8.0),
                            child: BarChart(),
                          ),
                        ],
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
