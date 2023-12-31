import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/route/route.dart';

// ignore: non_constant_identifier_names
Drawer BMSDrawer() {
  return Drawer(
    width: 200,
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        const SizedBox(
          height: 80,
          child: DrawerHeader(
            child: Center(child: Text('BUILDING MANAGEMENT')),
          ),
        ),
        ...drawerNavs.map(
          (e) => ListTile(
            leading: Icon(e['icon'] as IconData, color: Colors.black),
            title: Text(e['title'] as String),
            onTap: () => Get.offAllNamed(
              (e['path'] as String),
            ),
          ),
        ),
      ],
    ),
  );
}
