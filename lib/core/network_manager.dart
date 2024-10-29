import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'constant.dart';

class NetworkManager{
  final Dio dio;

  const NetworkManager._(this.dio);

  factory NetworkManager(){
    final Dio dio = Dio();

    /*dio.interceptors.add(

    );*/

    return NetworkManager._(dio);
  }

  Future<Response<T>> request<T>(
      RequestMethod method,
      String url, {
        data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
      }) {
    return dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.name,
        headers: headers,
      ),
    );
  }
}