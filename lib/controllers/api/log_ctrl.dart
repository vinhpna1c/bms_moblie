import 'package:bms_moblie/controllers/api/api.dart';
import 'package:bms_moblie/models/log/log.dart';

class LogController {
  static final LOG_PATH = '/log';

  static Future<List<Log>> getAllLog() async {
    List<Log> logs = [];
    final respond = await BMS_Api.get('$LOG_PATH/Living Room');
    if (respond.statusCode == 200) {
      final data = respond.data['data'];
      for (var log in data) {
        logs.add(Log.fromJson(log));
      }
    }
    return logs;
  }

  static Future<Log?> getLogDetail(String id) async {
    final respond = await BMS_Api.get('$LOG_PATH/$id');
    if (respond.statusCode == 200) {
      final data = respond.data;
      return Log.fromJson(data);
    }
    return null;
  }
}
