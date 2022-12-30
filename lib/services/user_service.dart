import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_base/core/constants/api_constants.dart';
import 'package:riverpod_base/models/user.dart';

class UserService extends StateNotifier<List<User>> {
  UserService() : super([]);
  // UserService._();
  // static final instance = UserService._();

  final url = ApiConstants.USER_API;

  Future<List<User>> getUsers() async {
    final response = await Dio().get(url);
    final data = response.data;
    List<User> users = response.statusCode == 200
        ? data.map<User>((c) {
            return User.fromJson(c);
          }).toList()
        : [];
    return users;
  }

  Future<Response> addUser(username, email) async {
    final response = await Dio()
        .post(url, data: {'username': username, 'email': email});
    print(response);
    return response;
  }
}
