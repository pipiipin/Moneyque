import 'package:dio/dio.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/transaction.dart';
import 'package:moneyque/user.dart';

class MoneyqueApi {
  // final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8081'));
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8081'));

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

  Future<List<User>> getUserByAuth(String authId) async {
    final response = await _dio.get('/users/auth');
    List<User> hits = [];

    (response.data['users'] as List)
        .map<User>((json) => User.fromJson(json))
        .forEach((element) {
      if (element.auth == authId) {
        hits.add(element);
      }
    });
    return hits;
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

  Future<List<Auth>> getAuths() async {
    final response = await _dio.get('/auths');
    return (response.data['auths'] as List)
        .map<Auth>((json) => Auth.fromJson(json))
        .toList();
  }

  Future<Auth> getAuthByUsername(String username) async {
    final response = await _dio
        .get('/auths/username', queryParameters: {'username': username});
    return Auth.fromJson(response.data['auths'][0]);
  }

  Future<Auth> getAuthByEmail(String email) async {
    final response =
        await _dio.get('/auths/email', queryParameters: {'email': email});
    return Auth.fromJson(response.data['auths'][0]);
  }

  Future<Auth> getAuthByPass(String id, String password) async {
    final response = await _dio.get('/auths');
    late Auth hit;

    (response.data['auths'] as List)
        .map<Auth>((json) => Auth.fromJson(json))
        .forEach((element) {
      if (element.id == id && element.password == password) {
        hit = element;
      }
    });
    return hit;
  }

  Future<Auth> getAuthById(String id) async {
    final response = await _dio.get('/auths');
    late Auth hit;

    (response.data['auths'] as List)
        .map<Auth>((json) => Auth.fromJson(json))
        .forEach((element) {
      if (element.id == id) {
        hit = element;
      }
    });
    return hit;
  }

  Future<Auth> createAuth(String username, String name, String email,
      String password, List<dynamic> tags) async {
    final response = await _dio.post('/auths', data: {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
      'tags': tags,
    });
    return Auth.fromJson(response.data);
  }
}
