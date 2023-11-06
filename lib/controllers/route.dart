import 'package:bms_moblie/pages/action/action_page.dart';
import 'package:bms_moblie/pages/dashboard/dashboard_page.dart';
import 'package:bms_moblie/pages/devices/device_detail_page.dart';
import 'package:bms_moblie/pages/devices/device_page.dart';
import 'package:bms_moblie/pages/devices/device_view_all_page.dart';
import 'package:bms_moblie/pages/people/people_page.dart';
import 'package:bms_moblie/pages/settings/home_page.dart';
import 'package:bms_moblie/pages/zone/zone_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final routePages = [
  GetPage(name: '/dashboard', page: () => const DashBoard()),
  GetPage(name: '/device', page: () => DevicePage()),
  GetPage(name: '/device/detail', page: () => const DeviceDetailPage()),
  GetPage(name: '/device/view', page: () => const DeviceViewAllPage()),
  GetPage(name: '/people', page: () => const PeoplePage()),
  GetPage(name: '/zone', page: () => const ZonePage()),
  GetPage(name: '/action', page: () => const ActionPage()),
  GetPage(name: '/setting', page: () => const SettingPage()),
];

final drawerNavs = [
  {
    'path': '/dashboard',
    'title': 'Dashboard',
    'icon': Icons.home,
  },
  {
    'path': '/device',
    'title': 'Devices',
    'icon': Icons.videocam,
  },
  {
    'path': '/people',
    'title': 'People',
    'icon': Icons.people,
  },
  {
    'path': '/zone',
    'title': 'Zones',
    'icon': Icons.branding_watermark,
  },
  {
    'path': '/action',
    'title': 'Actions',
    'icon': Icons.pending_actions_rounded,
  },
  {
    'path': '/setting',
    'title': 'Settings',
    'icon': Icons.settings,
  },
];
