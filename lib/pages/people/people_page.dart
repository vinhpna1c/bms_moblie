import 'package:bms_moblie/components/cards/people_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

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
                  children: recogs.map((recog) {
                    final people_recog = peoples
                        .where((people) => people['recogID'] == recog['id']);
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
                                recog['name'] as String,
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
                            children: people_recog
                                .map((people) => PeopleCard(
                                      avatar: people['avatar'] as String,
                                      peopleName: people['name'] as String,
                                      position: people['position'] as String,
                                    ))
                                .toList(),
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
