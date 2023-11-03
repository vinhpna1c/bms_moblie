import 'package:bms_moblie/models/constants/stream_type.dart';

final cameras = [
  {
    'id': '00001',
    'name': "1C Innovation - Ezviz",
    'zoneId': '00001',
    'zoneName': 'Zone 1',
    'uri': 'ezopen://open.ezviz.com/BA3686955/1.hd.live',
    'type': StreamType.EZVIZ,
  },
  {
    'id': '00002',
    'name': "1C Innovation - Hanet",
    'zoneId': '00001',
    'zoneName': 'Zone 1',
    'uri': 'ws://103.157.218.126:30000/',
    'type': StreamType.SOCKET,
  },
  {
    "id": '00003',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
  {
    "id": '00004',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
  {
    "id": '00005',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
  {
    "id": '00006',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
  {
    "id": '00007',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
  {
    "id": '00008',
    "name": "Camera Default",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "uri": '',
    "type": StreamType.DEFAULT,
  },
];

final zones = [
  {
    "id": '00001',
    "name": 'Zone 1',
    "description": 'Zone 1 description',
    "avatar": "assets/images/zone_placeholder.png",
    "setting": {
      "event": 'check-in',
      "limitPeople": 9999,
      "notify": false,
    }
  },
  {
    "id": '00002',
    "name": 'Zone 2',
    "description": 'Zone 2 description',
    "avatar": "assets/images/zone_placeholder.png",
    "setting": {
      "event": 'check-in',
      "limitPeople": 2,
      "notify": true,
    }
  }
];

final peoples = [
  {
    "id": '00001',
    "name": "Le Cong Minh Khoi",
    "email": "khoilcm@1cinnovation.com",
    "gender": "Male",
    "dob": "01/01/2001",
    "position": "Software Engineer",
    "recogID": '00001',
    "avatar": "assets/images/person_placeholder_1.jpg"
  },
  {
    "id": '00002',
    "name": "Phan Nguyen Anh Vinh",
    "email": "vinhpna@1cinnovation.com",
    "gender": "Male",
    "dob": "01/01/2001",
    "position": "Software Engineer",
    "recogID": '00001',
    "avatar": "assets/images/person_placeholder_1.jpg"
  },
  {
    "id": '00003',
    "name": "ID-112",
    "email": "",
    "gender": "Male",
    "dob": "",
    "position": "Unknown",
    "recogID": '00002',
    "avatar": "assets/images/person_placeholder_2.webp"
  },
  {
    "id": '00004',
    "name": "ID-123",
    "email": "",
    "gender": "Male",
    "dob": "",
    "position": "Unknown",
    "recogID": '00002',
    "avatar": "assets/images/person_placeholder_2.webp"
  },
];

final recogs = [
  {
    "id": '00001',
    "name": 'Employees',
    "description": 'Zone 1 description',
  },
  {
    "id": '00002',
    "name": 'Unknown',
    "description": 'Zone 1 description',
  }
];

final actions = [
  {
    "id": '00001',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00001',
    "zoneName": 'Zone 1',
    "cameraId": "00001",
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00002',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00001',
    "zoneName": 'Zone 1',
    "cameraId": "00001",
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00003',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00001',
    "zoneName": 'Zone 1',
    "cameraId": "00001",
    "peopleId": '00001',
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00004',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00001',
    "zoneName": 'Zone 1',
    "cameraId": "00001",
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00005',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "cameraId": "00002",
    "peopleName": 'Vinh PNA',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00006',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "cameraId": "00002",
    "peopleName": 'Vinh PNA',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00007',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "cameraId": "00002",
    "peopleName": 'Vinh PNA',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
  {
    "id": '00008',
    "time": '03/10/2023-09:00:00',
    "type": "Check-in",
    "zoneId": '00002',
    "zoneName": 'Zone 2',
    "cameraId": "00002",
    "peopleName": 'Vinh PNA',
    "uri": 'assets/images/activity_palceholder.jpeg',
  },
];

const recentDetecteds = [
  {
    "id": '00001',
    "time": '03/10/2023-09:00:00',
    "cameraId": '00001',
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/detected_face.png',
  },
  {
    "id": '00002',
    "time": '03/10/2023-09:00:00',
    "cameraId": '00001',
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/detected_face.png',
  },
  {
    "id": '00003',
    "time": '03/10/2023-09:00:00',
    "cameraId": '00002',
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/detected_face.png',
  },
  {
    "id": '00004',
    "time": '03/10/2023-09:00:00',
    "cameraId": '00002',
    "peopleName": 'Khoi LCM',
    "uri": 'assets/images/detected_face.png',
  },
];
