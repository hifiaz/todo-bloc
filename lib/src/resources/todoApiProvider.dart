import 'dart:async';

import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

class TodoApiProvider {
  Client client = Client();
  final _url = 'http://localhost:3000/api/';
  Future<List<Todo>> fetchTodoList() async {
    print('panggil data');
    final response = await client.get(_url);
    if (response.statusCode == 200) {
      // print(response.body.length);
      return compute(todoFromJson, response.body);

      // return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future addTodo(title) async {
    final response = await client.post("$_url/create", body: {'name': title});
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to add data');
    }
  }

  Future updateTodo(ids) async {
    // print('$_url$ids/update');
    final response = await client.put("$_url$ids/update", body: {'done': "true"});
    if (response.statusCode == 200) {
      print('berhasil di update');
      return response;
    } else {
      throw Exception('Failed to update data');
    }
  }
}
