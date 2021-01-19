import 'package:flutter/material.dart';
import 'package:flutter_graphql_todo/query/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../model/todo.dart';

class ListTodo extends StatefulWidget {
  ListTodo({Key key}) : super(key: key);

  @override
  ListTodotate createState() => ListTodotate();
}

class ListTodotate extends State<ListTodo> {
  Function() refecthQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Query(
        options: QueryOptions(documentNode: gql('''
                query{
                  ${QueryTodo().queryTodos()}
                }
                ''')),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          this.refecthQuery = refetch;

          if (result.hasException) {
            return Container(
              child: Text(result.exception.clientException.message),
            );
          }

          List<Todo> todos = List<Todo>();

          if (result.data != null) {
            for (var jsonTodo in result.data["todos"]) {
              todos.add(Todo.generateTodo(jsonTodo));
            }
          }

          return Container(
              child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, id) {
              return itemTodo(todos[id]);
            },
          ));
        },
      ),
    );
  }

  Widget itemTodo(Todo todo) {
    return Dismissible(
        confirmDismiss: (direction) async {
          final HttpLink httpLink = HttpLink(uri: "http://10.0.2.2:8080/query");

          var instance = GraphQLClient(
              link: httpLink,
              cache: OptimisticCache(
                dataIdFromObject: typenameDataIdFromObject,
              ));

          var result = await instance.mutate(
            MutationOptions(
              documentNode: gql('''
                  mutation delete(\$id: String!){
                    ${QueryTodo().mutationDeleteTodo()}
                  }
                '''),
              variables: {
                "id": todo.id,
              },
            ),
          );

          if (result.hasException) {
            if (result.exception.clientException != null) {
              print(result.exception.clientException.message);
            }

            for (var exception in result.exception.graphqlErrors) {
              print(exception.message);
            }
          }

          return result.hasException == false;
        },
        key: Key("todo_" +
            todo.id +
            DateTime.now().millisecondsSinceEpoch.toString()),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black38,
                width: 0.4,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(todo.text),
              Mutation(
                  options: MutationOptions(
                    documentNode: gql('''
                        mutation changeStatus(\$id: String!){
                          ${QueryTodo().mutationUpdateStatusTodo()}
                        }
                      '''),
                    onCompleted: (data) {
                      this.refecthQuery();
                    },
                  ),
                  builder: (RunMutation runMutation, QueryResult query) {
                    return Checkbox(
                        value: todo.done,
                        onChanged: (value) {
                          if (todo.done == false && value) {
                            runMutation({"id": todo.id});
                          }
                        });
                  })
            ],
          ),
        ));
  }
}
