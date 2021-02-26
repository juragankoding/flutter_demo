import 'package:flutter/material.dart';
import 'package:inheritWidget/modal/kontak_teman.dart';

class ItemKontak extends StatefulWidget {
  final ModelKontakTeman modelKontakTeman;

  ItemKontak({Key key, this.modelKontakTeman}) : super(key: key);

  @override
  _ItemKontakState createState() => _ItemKontakState();
}

class _ItemKontakState extends State<ItemKontak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text(widget.modelKontakTeman.nama)],
      ),
    );
  }
}
