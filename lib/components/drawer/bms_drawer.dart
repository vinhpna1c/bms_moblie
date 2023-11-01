import 'package:bms_moblie/controllers/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Drawer BMSDrawer() {
  return Drawer(
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
            onTap: () => Get.offAll((e['path'] as String),
          ),
        )
      ],
    ),
  );
}
