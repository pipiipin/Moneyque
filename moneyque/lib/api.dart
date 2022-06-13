import 'package:dio/dio.dart';
import 'package:moneyque/project.dart';

class MoneyqueApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8081'));

  Future<List<Project>> getProjects() async {
    final response = await _dio.get('');
    return (response.data['projects'] as List)
        .map<Project>((json) => Project.fromJson(json))
        .toList();
  }

  Future<Project> getProjectByName(String name) async {
    final response = await _dio.get('/name', queryParameters: {'name': name});
    return Project.fromJson(response.data['projects'][0]);
  }
}
