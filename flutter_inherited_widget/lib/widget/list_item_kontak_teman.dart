import 'package:flutter/material.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';
import 'package:inheritWidget/widget/item_kontak.dart';
import 'package:inheritWidget/widget/modal/show_input_kontak_teman.dart';

class ListKontakTeman extends StatefulWidget {
  ListKontakTeman({Key key}) : super(key: key);

  @override
  ListKontakTemanState createState() => ListKontakTemanState();
}

class ListKontakTemanState extends State<ListKontakTeman> {
  @override
  Widget build(BuildContext context) {
    var inheritedKontakTeman = InheritedWidgetKontakTeman.of(context);

    return Container(
      child: inheritedKontakTeman.listModelKontakTeman.length <= 0
          ? Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tidak data data kontak teman"),
                  ],
                ),
              ),
            )
          : ListView(
              children: List<Widget>.generate(
                  inheritedKontakTeman.listModelKontakTeman.length, (index) {
                return ItemKontak(
                  index: index,
                  parent: this,
                  onClick: () {
                    showInputKontak(this,
                        modelKontakTeman:
                            inheritedKontakTeman.listModelKontakTeman[index]);
                  },
                );
              }),
            ),
    );
  }
}
