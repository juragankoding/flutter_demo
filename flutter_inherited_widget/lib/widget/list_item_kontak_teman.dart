import 'package:flutter/material.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';
import 'package:inheritWidget/widget/item_kontak.dart';

class ListKontakTeman extends StatefulWidget {
  ListKontakTeman({Key key}) : super(key: key);

  @override
  _ListKontakTemanState createState() => _ListKontakTemanState();
}

class _ListKontakTemanState extends State<ListKontakTeman> {
  @override
  Widget build(BuildContext context) {
    var inheritedKontakTeman = InheritedWidgetKontakTeman.of(context);

    return Container(
      child: ListView(
        children: List<Widget>.generate(
            inheritedKontakTeman.listModelKontakTeman.length, (index) {
          return ItemKontak(
            modelKontakTeman: inheritedKontakTeman.listModelKontakTeman[index],
          );
        }),
      ),
    );
  }
}
