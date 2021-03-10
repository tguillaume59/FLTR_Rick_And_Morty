import 'package:dio/dio.dart';

abstract class BaseApiServices{

  final Dio _dio;

  BaseApiServices(this._dio);

  //get Data Json
  Future<dynamic> getData(String url) async {
    try {
      final response = await _dio.get(
        "https://rickandmortyapi.com/api/$url",
        options: Options(
          headers: {'accept': 'application/json'},
        ),
      );
      return response.data;
    } on DioError catch (error, stacktrace) {
      if (error.response != null) {
        switch (error.response.statusCode) {
          default:
            print(error.message);
        }
      } else {
        print(error.message);
      }
    } catch (error) {
      // Other error ? Looks like a bad thing
      throw error;
    }
  }
}