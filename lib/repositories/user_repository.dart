import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_intern_test_app/models/user_model.dart';

class UserRepository {
  var client = http.Client();

  Future<List<User>> getUsers({int page = 1, int perPage = 10}) async {
    final response = await http.get(
      Uri.https('reqres.in', '/api/users', {
        'page': page.toString(),
        'per_page': perPage.toString(),
      }),
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)['data'] as List)
        .map((user) => User.fromJson(user))
        .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
