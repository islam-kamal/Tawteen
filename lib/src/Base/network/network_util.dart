
import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/shared_preference_manger.dart';
import 'package:dio/dio.dart';

import 'network-mappers.dart';

class NetworkUtil {
  static final NetworkUtil _instance = new NetworkUtil.internal();
SharedPreferenceManager sharedPreferenceManager =SharedPreferenceManager();
  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Dio dio = Dio();

  Future<ResponseType> get <ResponseType extends Mappable>(ResponseType responseType, String url,
      {Map<String, dynamic>? headers}) async {

    Response? response ;
    try {
      dio.options.baseUrl = baseUrl;
      print("get url : ${url}");
      response = await dio.get(
          url,
   //       queryParameters:Map<String, dynamic>.from(headers),
        options: Options(
          headers: headers,
          contentType: 'application/json',
        )
      );
      print("get response : ${response}");
    } on DioError catch (e) {
      print("get error : ${e}");
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response, responseType);
  }

  Future<ResponseType> post<ResponseType extends Mappable>(ResponseType responseType, String url,
      {Map<String, dynamic>? headers, FormData? body, encoding}) async {
    var response;
    dio.options.baseUrl = baseUrl;
    try {
      print("post url : ${url}");
      response = await dio.post(url,
          data: body,
          options: Options(headers: headers, requestEncoder: encoding ,
              followRedirects: false,  validateStatus: (status) { return status! < 500; }));
      print("post response : ${response}");
    } on DioError catch (e) {
      print("post error : ${e}");
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response, responseType);

  }


  Future<ResponseType> delete<ResponseType extends Mappable>(ResponseType responseType,String url, {Map<String, dynamic>? headers}) {
    return dio
        .delete(
      url,
      options: Options(headers: headers!),

    )
        .then((Response response) {

      return handleResponse(response, responseType);
    });
  }

  Future<ResponseType> put<ResponseType extends Mappable>(ResponseType? responseType,String? url, {Map<String, dynamic>? headers, body, encoding}) {
    return dio
        .put(url!,
        data: body,
        options: Options(headers: headers, requestEncoder: encoding))
        .then((Response response) {
      return handleResponse(response, responseType);
    });
  }


  ResponseType handleResponse<ResponseType extends Mappable>(Response? response, ResponseType? responseType) {
    final int? statusCode = response!.statusCode;
    if (statusCode! >= 200 && statusCode < 300) {
      return Mappable(responseType!, response.toString()) as ResponseType;
    } else {
      return Mappable(responseType!, response.toString()) as ResponseType;
    }
  }


}
