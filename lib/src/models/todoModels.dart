// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<Todo>.from(jsonData.map((x) => Todo.fromJson(x)));
}

String todoToJson(List<Todo> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Todo {
    String id;
    String name;
    bool done;
    int v;

    Todo({
        this.id,
        this.name,
        this.done,
        this.v,
    });

    factory Todo.fromJson(Map<String, dynamic> json) => new Todo(
        id: json["_id"],
        name: json["name"],
        done: json["done"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "done": done,
        "__v": v,
    };
}
