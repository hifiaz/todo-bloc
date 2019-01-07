import 'dart:async';

import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

class TodoApiProvider{
  Client client = Client();
  final _url = 'http://localhost:3000/api/';
  Future<List<Todo>> fetchTodoList() async {
    print('Masuk');
    final response = await client.get(_url);
    if(response.statusCode == 200){
      // print(response.body.length);
      return compute(todoFromJson, response.body);
      
      // return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to Load');
    }
  }
}