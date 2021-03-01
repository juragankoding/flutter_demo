import 'package:flutter/material.dart';
import 'package:inheritWidget/model/kontak_teman.dart';
import 'package:inheritWidget/style/style.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';

Future<void> showInputKontak(State state, {ModelKontakTeman modelKontakTeman}) {
  BuildContext innerContext = state.context;
  InheritedWidgetKontakTeman inheritedWidgetKontakTeman =
      InheritedWidgetKontakTeman.of(innerContext);

  TextEditingController textEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();
  TextEditingController noTeleponEditController = TextEditingController();

  if (modelKontakTeman != null) {
    textEditController.text = modelKontakTeman.nama;
    emailEditController.text = modelKontakTeman.email;
    noTeleponEditController.text = modelKontakTeman.noTelepon;
  }

  return showDialog(
      context: innerContext,
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
                    controller: textEditController,
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                    decoration: inputDecoration,
                    cursorColor: Colors.black),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Input nomor kontak teman kamu?",
                  style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                ),
                TextField(
                    controller: noTeleponEditController,
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                    decoration: inputDecoration,
                    cursorColor: Colors.black),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Input email kontak teman kamu?",
                  style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                ),
                TextField(
                    controller: emailEditController,
                    style: TextStyle(fontSize: 12, fontFamily: "Tahoma"),
                    decoration: inputDecoration,
                    cursorColor: Colors.black),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if (modelKontakTeman != null) {
                inheritedWidgetKontakTeman.ubah(
                    inheritedWidgetKontakTeman.listModelKontakTeman
                        .indexOf(modelKontakTeman),
                    ModelKontakTeman(
                      email: emailEditController.text,
                      nama: textEditController.text,
                      noTelepon: noTeleponEditController.text,
                    ));
              } else {
                inheritedWidgetKontakTeman.tambah(ModelKontakTeman(
                  email: emailEditController.text,
                  nama: textEditController.text,
                  noTelepon: noTeleponEditController.text,
                ));
              }

              emailEditController.text = "";
              textEditController.text = "";
              noTeleponEditController.text = "";

              Navigator.of(innerContext).pop();

              state.setState(() {});
            },
            color: Theme.of(innerContext).accentColor,
            child: Text(modelKontakTeman != null ? "Ubah" : "Tambahkan"),
          )
        ],
      ));
}
