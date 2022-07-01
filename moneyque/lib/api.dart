import 'package:dio/dio.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/transaction.dart';
import 'package:moneyque/user.dart';

class MoneyqueApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8081'));
  //final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8081'));

  Future<List<Project>> getProjects() async {
    final response = await _dio.get('/projects');
    return (response.data['projects'] as List)
        .map<Project>((json) => Project.fromJson(json))
        .toList();
  }

  Future<Project> getProjectByName(String name) async {
    final response =
        await _dio.get('/projects/name', queryParameters: {'name': name});
    return Project.fromJson(response.data['projects'][0]);
  }

  Future<Project> getProjectById(String id) async {
    final response = await _dio.get('/projects');
    late Project hit;

    (response.data['projects'] as List)
        .map<Project>((json) => Project.fromJson(json))
        .forEach((element) {
      if (element.id == id) {
        hit = element;
      }
    });
    return hit;
  }

  Future<List<User>> getUsers() async {
    final response = await _dio.get('/users');
    return (response.data['users'] as List)
        .map<User>((json) => User.fromJson(json))
        .toList();
  }

  Future<User> getUserById(String id) async {
    final response = await _dio.get('/users');
    late User hit;

    (response.data['users'] as List)
        .map<User>((json) => User.fromJson(json))
        .forEach((element) {
      if (element.id == id) {
        hit = element;
      }
    });
    return hit;
  }

  Future<List<Transaction>> getTransactionsByUser(String userId) async {
    final response = await _dio.get('/transactions');
    List<Transaction> hits = [];

    (response.data['transactions'] as List)
        .map<Transaction>((json) => Transaction.fromJson(json))
        .forEach((element) {
      if (element.owner == userId) {
        hits.add(element);
      }
    });
    return hits;
  }
}
