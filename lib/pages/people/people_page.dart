import 'package:bms_moblie/components/cards/people_card.dart';
import 'package:bms_moblie/controllers/people_ctrl.dart';
import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:bms_moblie/layouts/page_container.dart';
import 'package:bms_moblie/models/mock/data.dart';
import 'package:bms_moblie/models/person/person.dart';
import 'package:bms_moblie/pages/people/person_detail_page.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  RxList<Person> people = <Person>[].obs;

  @override
  void initState() {
    PeopleController.getAllPeople().then((data) {
      people.clear();
      people.addAll(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: PageContainer(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Peoples',
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
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 16, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Emloyees',
                            style: BMSTextStyles.h1Text,
                          ),
                          Text(
                            'View All',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Center(
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: people
                              .map((person) => InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          PersonDetailPage(person: person));
                                    },
                                    child: PeopleCard(
                                      avatar:
                                          'assets/images/person_placeholder_1.jpg',
                                      peopleName: person.name ?? '',
                                      position: 'Software Engineering',
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
