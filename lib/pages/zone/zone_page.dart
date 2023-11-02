import 'package:bms_moblie/components/cards/zone_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZonePage extends StatelessWidget {
  const ZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'People',
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
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: zones
                              .map((zone) => ZoneCard(
                                    avatar: zone['avatar'] as String,
                                    zoneName: zone['name'] as String,
                                  ))
                              .toList(),
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
