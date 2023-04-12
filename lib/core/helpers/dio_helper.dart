import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../errors/exceptions.dart';
import '../repo/bearer_token_repo.dart';


class DioHelper
{
  static String baseUrl = "https://influenceracademy.digital/api";
  static String api = baseUrl;
  BearerTokenRepo bearerTokenRepo = BearerTokenRepo();

  Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
        'content-Type': 'application/json',
      },
    ),
  );

  DioHelper() {
    String? token = bearerTokenRepo.getBearerToken();
    if(token != null) {
      dio.options.headers["authorization"] = "Bearer $token";
    }
    _fixCertificateProblem();
  }
  void _fixCertificateProblem(){
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> postDataWithoutToken(String parameter, dynamic data) async
  {
    final response = await dio.post('$api/$parameter',
        data: data ,
        options: Options(
          method: 'POST',
          validateStatus: (state) => state! < 500,
          // followRedirects: false,
          // validateStatus: (status) => true,
        )
    );
    return handleResponse(response);
  }

  Future<dynamic> postData(String parameter, dynamic data, {bool rawParameter = false}) async
  {
    final response = await dio.post( rawParameter ? parameter : '$api/$parameter',
        data: data,
        options: Options(
          contentType: 'application/json',
          method: 'POST',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> putData(String parameter, Map<String, dynamic> data,) async
  {
    print(data);
    final response = await dio.put('$api/$parameter',
        data: json.encoder.convert(data),
        options: Options(
          contentType: 'application/json',
          method: 'PUT',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<void> delData(String parameter,) async
  {
    final response = await dio.delete('$api/$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'DEL',
          validateStatus: (state) => state! < 500,
        ));
  }

  Future<Map<String,dynamic>> getDataWithoutToken(String parameter) async
  {
      Response response = await dio.get('$api/$parameter');
      return handleResponse(response);
  }

  Future<dynamic> getData(String parameter, {bool rawParameter = false}) async
  {
    // log('$api/$parameter');
    Response response = await dio.get(rawParameter ? parameter : '$api/$parameter');
    return handleResponse(response);
  }

  dynamic handleResponse(Response response){
    // log(response.statusCode.toString());
    // log(response.data.toString());
    if(response.statusCode.toString()[0] != "2"){
      log(response.data.toString());
      throw ServerException(exceptionMessage: response.data["message"],);
    }
    return response.data ;
  }
}
