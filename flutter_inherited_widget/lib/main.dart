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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ModelKontakTeman {
  String nama;
  String noTelepon;
  String email;

  ModelKontakTeman({this.email, this.nama, this.noTelepon});
}

class InheritedWidgetKontakTeman extends InheritedWidget {
  InheritedWidgetKontakTeman({
    Key key,
    @required listModelKontakTeman,
    @required Widget child,
  })  : assert(child != null),
        this.listModelKontakTeman =
            listModelKontakTeman ?? List<ModelKontakTeman>(),
        super(key: key, child: child);

  List<ModelKontakTeman> listModelKontakTeman = List();

  static InheritedWidgetKontakTeman of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetKontakTeman>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidgetKontakTeman oldWidget) {
    return listModelKontakTeman != oldWidget.listModelKontakTeman;
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
  Widget build(BuildContext context) {
    return InheritedWidgetKontakTeman(
      key: Key("TemanKontak"),
      listModelKontakTeman: List<ModelKontakTeman>(),
      child: Builder(
        builder: (BuildContext innerContext) {
          return Scaffold(
            body: ListView(
              children: List<Widget>.generate(
                  InheritedWidgetKontakTeman.of(innerContext)
                      .listModelKontakTeman
                      .length, (index) {
                return Container();
              }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(aweson),
            ),
          );
        },
      ),
    );
  }
}
