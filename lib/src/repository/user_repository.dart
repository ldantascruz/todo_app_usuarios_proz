import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:todo_app/src/model/user_model.dart';

abstract class IUserRepository {
  Future<void> createUser(UserModel user);
  Future<List<UserModel>> getAllUsers();
}

class UserRepository implements IUserRepository {
  final _http = Client();
  final _headers = {"Content-Type": "application/json"
  };

  @override
  Future<void> createUser(UserModel user) async {
    try {
      final response = await _http.post(
        Uri.parse(
          'https://crudcrud.com/api/d2abc14797a54e9f89b220784285d9d6/users/',
        ),
        headers: _headers,
        body: user.toJson(),
      );
      if (response.statusCode == 201) {
        log(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await _http.get(
        Uri.parse(
          'https://crudcrud.com/api/d2abc14797a54e9f89b220784285d9d6/users/',
        ),
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final decodedList =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));

        final usersList = decodedList.map((e) => UserModel.fromMap(e)).toList();
        return usersList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
