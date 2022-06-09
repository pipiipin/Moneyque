import 'package:dio/dio.dart';

class MoneyqueApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8081'));

  Future<List> getProjects() async {
    final response = await _dio.get('');
    return response.data['projects'];
  }
}
