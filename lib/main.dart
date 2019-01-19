import 'package:exampletododevindo/create.dart';
import 'package:exampletododevindo/src/blocs/todoBloc.dart';
import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    bloc.fetchAllTodo();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.allTodo,
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Create()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Todo>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return  CheckboxListTile(
            value: snapshot.data[index].done,
            title: Text(snapshot.data[index].name),
            // subtitle: Text(snapshot.data[index].id),
            onChanged: (bool isChecked){
              bloc.getId(snapshot.data[index].id.toString());
              bloc.updateTodo();
              bloc.fetchAllTodo();
            },
          );
        });
  }
}
