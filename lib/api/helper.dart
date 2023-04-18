import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:users_app/models/user.dart';

fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final docs = data['data'];

    // print('Length of docs: ${docs.length}');
    // print('First book: ${docs[0]!['volumeInfo']['title']}');

    final result = (docs as List).map((e) => User.fromJson(e)).toList();
    return result;
  } else {
    // print('Request failed with status: ${response.statusCode}.');
  }
}

postUser(User user) async {
  final response = await http.post(Uri.parse('https://reqres.in/api/users'),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
  if (response.statusCode == 201) {
    var data = jsonDecode(response.body);
    // convert data to user object
    var userObj = User.fromJson(data);

    return userObj;
  } else {
    return null;
  }
}
