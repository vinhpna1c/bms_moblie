import 'package:bms_moblie/components/drawer/bms_drawer.dart';
import 'package:bms_moblie/styles/colors.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String? titleAppBar;
  final Widget? body;

  const AppLayout({
    super.key,
    this.body,
    this.titleAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BMSDrawer(),
      appBar: AppBar(
        backgroundColor: BMSColors.primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text('Hi, User'),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
      body: body,
    );
  }
}
