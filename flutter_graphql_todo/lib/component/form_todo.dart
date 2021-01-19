import 'package:flutter/material.dart';
import 'package:flutter_graphql_todo/query/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'list_todo.dart';

class FormTodo extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ListTodotate> globalKeyList = GlobalKey();

  FormTodo({Key key, @required this.globalKeyList}) : super(key: key);

  void _openAddTodo(BuildContext context, {Function(String) onCreate}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: form(
            onCreate: onCreate,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text = "";

    return Mutation(
        options: MutationOptions(
          documentNode: gql('''
                  mutation createTodo(\$text: String!) {
                    ${QueryTodo().mutationCreateTodo()}
                  }
              '''),
          update: (cache, result) {
            return cache;
          },
          onCompleted: (data) {
            Navigator.of(context).pop();

            this.globalKeyList.currentState.refecthQuery();
          },
        ),
        builder: (RunMutation runMutation, QueryResult result) {
          if (result.hasException) {
            print(result.exception.graphqlErrors.first.message);

            if (result.exception.clientException != null) {
              print(result.exception.clientException.message);
            }
          }

          return FloatingActionButton(
            onPressed: () {
              _openAddTodo(context, onCreate: (value) {
                runMutation({
                  "text": value,
                });
              });
            },
            backgroundColor: Colors.purple[300],
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        });
  }

  Widget form( {Function(String) onCreate}) {
    return Container(
        padding: EdgeInsets.only(
          top: 30,
          right: 30,
          left: 30,
          bottom: 30,
        ),
        child: Form(
            key: this.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Todo",
                  style: TextStyle(fontSize: 21, color: Colors.purple[300]),
                ),
                TextFormField(
                  validator: (text) {
                    return text == "" ? "Text tidak boleh kosong" : null;
                  },
                  controller: textEditingController,
                  onEditingComplete: () {},
                  decoration: InputDecoration(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      color: Colors.purple[400],
                      onPressed: () {
                        if (this.formKey.currentState.validate()) {
                          onCreate(this.textEditingController.text);
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  ],
                )
              ],
            )));
    ;
  }
}
