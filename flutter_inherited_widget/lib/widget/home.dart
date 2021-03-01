import 'package:flutter/material.dart';
import 'package:inheritWidget/model/kontak_teman.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';
import 'package:inheritWidget/widget/list_item_kontak_teman.dart';
import 'package:inheritWidget/widget/modal/show_input_kontak_teman.dart';

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
          showInputKontak(this);
        },
        child: Icon(
          Icons.plus_one,
        ),
      ),
    );
  }
}
