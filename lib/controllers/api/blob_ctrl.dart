import 'package:bms_moblie/controllers/api/api.dart';
import 'package:dio/dio.dart';

class BlobController {
  static String getUrlByID(String id) {
    return 'http://$BMS_HOST:$BMS_BLOB_PORT/camera/$id';
  }

  static Future<String?> uploadImage(String filePath,
      {String? fileName}) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath,
          filename: fileName ??= filePath.split('/').last)
    });

    final respond = await BMS_Blob.post('/upload', data: formData);
    // return file path if created
    if (respond.statusCode == 200) {
      return getUrlByID(respond.data['stored_name'] as String);
    }
    // return
    return null;
  }
}
