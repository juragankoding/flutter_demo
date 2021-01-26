import 'package:flutter_graphql_todo/model/todo.dart';

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

  String querySingleTopo() {
    return '''
    singleTodo(id: \$id){
      id
      text
      done
    }
    ''';
  }

  String mutationCreateTodo() {
    return '''
    createTodo(input: {text: \$text}){
      id
      text
      done
    }
    ''';
  }

  String mutationUpdateTodo() {
    return '''
    updateTodo(input: {id: \$id, text: \$text, done: \$done}){
      id
      text
      done
    }
    ''';
  }

  String mutationUpdateStatusTodo() {
    return '''
    updateStatusTodo(id: \$id){
      Message
    }
    ''';
  }

  String mutationDeleteTodo() {
    return '''
    deleteTodo(id: \$id){
      Message
    }
    ''';
  }
}
