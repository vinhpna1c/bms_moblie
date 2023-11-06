import 'package:bms_moblie/styles/colors.dart';
import 'package:bms_moblie/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleRouteLayout extends StatelessWidget {
  final Widget? body;
  final String? title;

  const SingleRouteLayout({super.key, this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white, onPressed: () => Get.back()),
        centerTitle: true,
        title: Text(
          title ?? '',
          style: BMSTextStyles.pageTitle.copyWith(color: Colors.white),
        ),
        backgroundColor: BMSColors.primaryColor,
      ),
      body: body,
    );
  }
}
