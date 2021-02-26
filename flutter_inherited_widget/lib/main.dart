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

  void tambah(ModelKontakTeman kontakTeman) {
    this.listModelKontakTeman.add(kontakTeman);
  }

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
  TextEditingController textEditController,
      emailEditController,
      noTeleponEditController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.textEditController = TextEditingController();
    this.emailEditController = TextEditingController();
    this.noTeleponEditController = TextEditingController();
  }

  void showInputKontak() {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Input nama teman kamu?",
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                  ),
                  TextField(
                      controller: this.textEditController,
                      style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                      cursorColor: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Input nomor kontak teman kamu?",
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                  ),
                  TextField(
                      controller: this.noTeleponEditController,
                      style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                      cursorColor: Colors.black),
                  Text(
                    "Input email kontak teman kamu?",
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                  ),
                  TextField(
                      controller: this.emailEditController,
                      style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                      cursorColor: Colors.black),
                ],
              ),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                InheritedWidgetKontakTeman.of(context).tambah(ModelKontakTeman(
                  email: this.emailEditController.text,
                  nama: this.textEditController.text,
                  noTelepon: this.noTeleponEditController.text,
                ));

                this.emailEditController.text = "";
                this.textEditController.text = "";
                this.noTeleponEditController.text = "";
              },
              color: Theme.of(context).accentColor,
              child: Text("Tambahkan"),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWidgetKontakTeman(
      key: Key("TemanKontak"),
      listModelKontakTeman: List<ModelKontakTeman>(),
      child: Builder(
        builder: (BuildContext innerContext) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Kontak Teman"),
            ),
            body: ListView(
              children: List<Widget>.generate(
                  InheritedWidgetKontakTeman.of(innerContext)
                      .listModelKontakTeman
                      .length, (index) {
                return Container(
                  child: Text(InheritedWidgetKontakTeman.of(innerContext)
                      .listModelKontakTeman[index]
                      .nama),
                );
              }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: this.showInputKontak,
              child: Icon(
                Icons.plus_one,
              ),
            ),
          );
        },
      ),
    );
  }
}
