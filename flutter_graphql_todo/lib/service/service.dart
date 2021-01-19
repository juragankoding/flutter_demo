import 'package:flutter/cupertino.dart';
import 'package:flutter_graphql_todo/model/todo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphService {
  static GraphService _instance;

  ValueNotifier<GraphQLClient> client;

  GraphService({@required this.client});

  static get getInstance {
    if (_instance == null) {
      final HttpLink httpLink = HttpLink(uri: "http://10.0.2.2:8080/query");

      ValueNotifier<GraphQLClient> client =
          ValueNotifier(GraphQLClient(cache: InMemoryCache(), link: httpLink));

      _instance = GraphService(client: client);
    }

    return _instance;
  }
}
