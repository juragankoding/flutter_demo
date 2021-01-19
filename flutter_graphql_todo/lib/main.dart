import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_graphql_todo/component/form_todo.dart';
import 'package:flutter_graphql_todo/component/list_todo.dart';
import 'package:flutter_graphql_todo/query/query.dart';
import 'package:flutter_graphql_todo/service/service.dart';
import 'package:flutter_graphql_todo/model/todo.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey globalKey = GlobalKey();
  GlobalKey<ListTodotate> globalKeyList = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphService.getInstance.client,
      child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Todos",
                        style: TextStyle(
                          color: Colors.purple[300],
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Center(
                  child: ListTodo(
                    key: globalKeyList,
                  ),
                ))
              ],
            ),
          ),
          floatingActionButton: FormTodo(globalKeyList: this.globalKeyList)),
    );
  }
}
