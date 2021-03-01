import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inheritWidget/model/kontak_teman.dart';

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

  void hapus(int index) {
    this.listModelKontakTeman.removeAt(index);
  }

  void ubah(int index, ModelKontakTeman modelKontakTeman) {
    this.listModelKontakTeman[index] = modelKontakTeman;
  }

  static InheritedWidgetKontakTeman of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetKontakTeman>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidgetKontakTeman oldWidget) {
    print(listModelKontakTeman != oldWidget.listModelKontakTeman);
    return true;
  }
}
