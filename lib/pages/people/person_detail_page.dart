import 'package:bms_moblie/components/cards/action_card.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/layouts/single_route_layout.dart';
import 'package:bms_moblie/models/person/person.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:bms_moblie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonDetailPage extends StatelessWidget {
  final Person person;
  const PersonDetailPage({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleRouteLayout(
      title: 'Person',
      body: PageContainer(
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     'Person',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            //   ),
            // ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: Get.size.width,
                constraints: BoxConstraints(
                  minHeight: Get.size.height - 50,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  handleImagePathServer(person.avatarUrl ?? ''),
                                  // fit: BoxFit.cover,
                                  // errorBuilder: (c, o, s) => const Icon(
                                  //   Icons.person,
                                  //   size: 116,
                                  //   color: Colors.white,
                                  // ),
                                ),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(bottom: 24),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(bottom: 16),
                      child: Column(children: [
                        InformationRow(
                            title: 'Email',
                            content:
                                '${person.name?.toLowerCase()}@1cinnovation.com'),
                        InformationRow(
                            title: 'Name', content: person.name ?? ''),
                        InformationRow(
                            title: 'Gender',
                            content: person.gender == 1 ? 'Male' : 'Female'),
                        InformationRow(
                            title: 'Date of birth',
                            content: DateFormat('dd/MM/yyyy').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    person.dob ?? 0))),
                        InformationRow(
                            title: 'Phone', content: person.phone ?? ''),
                      ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recently Activity',
                            style: BMSTextStyles.h3Text,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ActionCard(
                                    faceId: 1,
                                    uri:
                                        'assets/images/person_placeholder_2.webp',
                                    actions: 'check-in',
                                    cameraId: 1,
                                    time: '6 Sep,23 09:00:00'),
                                ActionCard(
                                    faceId: 1,
                                    uri:
                                        'assets/images/person_placeholder_2.webp',
                                    actions: 'check-in',
                                    cameraId: 1,
                                    time: '6 Sep,23 09:00:00'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

Widget InformationRow({
  String title = '',
  String content = '',
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: BMSTextStyles.h3Text.copyWith(color: Colors.grey.shade400),
          ),
        ),
        Text(content)
      ],
    ),
  );
}
