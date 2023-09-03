import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AppPublishModel/app_publish_model.dart';


class AppPublishRepository{

  Future<List<AppPublishModel>> getAppPublishInfo() async {
    List<AppPublishModel> app_publish_list = [];
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
    await dio.get(
        baseUrl + getAppPublishInfoUrl
    ).then((value){
    app_publish_list =   AppPublishModel.fromJsonList(value.data);
    });

    return app_publish_list;
  }
}
final appPublishRepository = AppPublishRepository();