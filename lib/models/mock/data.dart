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
    "setting": {
      "event": 'check-in',
      "limitPeople": 9999,
      "notify": false,
    }
  },
  {
    "id": '00002',
    "name": 'Zone 2 - Security zone',
    "description": 'Zone 2 description',
    "setting": {
      "event": 'check-in',
      "limitPeople": 2,
      "notify": true,
    }
  }
];
