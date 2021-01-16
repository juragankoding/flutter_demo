import 'package:flutter/material.dart';
import 'package:flutter_graphql_todo/query.dart';
import 'package:flutter_graphql_todo/service.dart';
import 'package:flutter_graphql_todo/todo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphService.getInstance.client,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Query(
            options: QueryOptions(documentNode: gql('''
          query{
            ${QueryTodo().queryTodos()}
          }
          ''')),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Container(
                  child: Text(result.exception.clientException.message),
                );
              }

              List<Todo> todos = List<Todo>();

              for (var jsonTodo in result.data) {
                todos.add(Todo.generateTodo(jsonTodo));
              }

              return Container(
                  child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, id) {
                  return Container(
                    child: Text(id.toString()),
                  );
                },
              ));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
