import 'dart:convert';

import 'package:flutter_testing/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<UserData>> fetchUserData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    final jsonData = jsonDecode(response.body)['results'] as List;
    return jsonData
        .map((item) => UserData(
              firstname: item['name']['first'],
              lastname: item['name']['last'],
              email: item['email'],
              tel: item['phone'],
              image: item['picture']['large'],
            ))
        .toList();
  }
}
