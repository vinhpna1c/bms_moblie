import 'package:bms_moblie/styles/colors.dart';
import 'package:flutter/material.dart';

Widget PageContainer({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(color: BMSColors.backgroundColor),
    padding: const EdgeInsets.all(8.0),
    child: child,
  );
}
