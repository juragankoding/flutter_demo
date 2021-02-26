import 'package:flutter/material.dart';
import 'package:inheritWidget/modal/kontak_teman.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';
import 'package:inheritWidget/widget/list_data_kontak.dart';

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
    super.initState();

    this.textEditController = TextEditingController();
    this.emailEditController = TextEditingController();
    this.noTeleponEditController = TextEditingController();
  }

  void showInputKontak(BuildContext innerContext) {
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
                InheritedWidgetKontakTeman.of(innerContext)
                    .tambah(ModelKontakTeman(
                  email: this.emailEditController.text,
                  nama: this.textEditController.text,
                  noTelepon: this.noTeleponEditController.text,
                ));

                this.emailEditController.text = "";
                this.textEditController.text = "";
                this.noTeleponEditController.text = "";

                Navigator.of(context).pop();

                setState(() {});
              },
              color: Theme.of(context).accentColor,
              child: Text("Tambahkan"),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontak Teman"),
      ),
      body: Container(
        child: ListKontakTeman(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInputKontak(context);
        },
        child: Icon(
          Icons.plus_one,
        ),
      ),
    );
  }
}
