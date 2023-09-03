
import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/shared_preference_manger.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'network-mappers.dart';

class NetworkUtil {
  static final NetworkUtil _instance = new NetworkUtil.internal();
SharedPreferenceManager sharedPreferenceManager =SharedPreferenceManager();
  NetworkUtil.internal();

  factory NetworkUtil() => _instance;



  Future<ResponseType> get <ResponseType extends Mappable>(ResponseType responseType, String url,
      {Map<String, dynamic>? headers}) async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    Response? response ;
    try {
      dio.options.baseUrl = baseUrl;
      response = await dio.get(
          url,
   //       queryParameters:Map<String, dynamic>.from(headers),
        options: Options(
          headers: headers,
          contentType: 'application/json',
        )
      );
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }

    return handleResponse(response, responseType);
  }

  Future<ResponseType> post<ResponseType extends Mappable>(ResponseType responseType, String url,
      {Map<String, dynamic>? headers, var body, encoding}) async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    var response;
    dio.options.baseUrl = baseUrl;
    try {

      response = await dio.post(url,
          data: body,
          options: Options(headers: headers, requestEncoder: encoding ,
              followRedirects: false,  validateStatus: (status) { return status! < 500; })
      );
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response, responseType);

  }


  Future<ResponseType> delete<ResponseType extends Mappable>(ResponseType responseType,String url,
      {Map<String, dynamic>? headers}) {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    return dio
        .delete(
      url,
      options: Options(headers: headers!),

    )
        .then((Response response) {
      return handleResponse(response, responseType);
    });
  }

  Future<ResponseType> put<ResponseType extends Mappable>(ResponseType? responseType,String? url,
      {Map<String, dynamic>? headers, body, encoding}) {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
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
