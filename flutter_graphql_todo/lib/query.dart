import 'package:flutter_graphql_todo/todo.dart';

class QueryTodo {
  String queryTodos() {
    return '''
    todos(){
      id
      text
      done
    }
    ''';
  }

  String querySingleTopo(int id) {
    return '''
    singleTodo(id: $id){
      id
      text
      done
    }
    ''';
  }

  String mutationCreateTodo(Todo todo) {
    return '''
    createTodo(input: {id: "${todo.id}", text:"${todo.text}", done:${todo.done}}){
      id
      text
      done
    }
    ''';
  }

  String mutationUpdateTodo(Todo todo) {
    return '''
    updateTodo(input: {id: "${todo.id}", text:"${todo.text}", done:${todo.done}}){
      id
      text
      done
    }
    ''';
  }

  String mutationDeleteTodo(int i) {
    return '''
    deleteTodo(id: "$i"){
      message
    }
    ''';
  }
}
