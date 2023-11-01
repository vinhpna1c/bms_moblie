import 'package:bms_moblie/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Text('Home Page'),
    );
  }
}
