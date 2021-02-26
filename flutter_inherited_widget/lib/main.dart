import 'package:flutter/material.dart';
import 'package:inheritWidget/modal/kontak_teman.dart';
import 'package:inheritWidget/widget/home.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';

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
        home: InheritedWidgetKontakTeman(
            key: Key("TemanKontak"),
            listModelKontakTeman: List<ModelKontakTeman>(),
            child: Builder(
              builder: (context) {
                return MyHomePage(title: 'Flutter Demo Home Page');
              },
            )));
  }
}
