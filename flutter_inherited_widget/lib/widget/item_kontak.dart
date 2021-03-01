import 'package:flutter/material.dart';
import 'package:inheritWidget/widget/inherited_kontak_teman.dart';
import 'package:inheritWidget/widget/list_item_kontak_teman.dart';

class ItemKontak extends StatelessWidget {
  final int index;
  final ListKontakTemanState parent;
  final Function() onClick;

  ItemKontak({Key key, this.index, this.parent, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InheritedWidgetKontakTeman inheritedKontakTeman =
        InheritedWidgetKontakTeman.of(context);

    var modelKontakTeman = inheritedKontakTeman.listModelKontakTeman[index];

    return GestureDetector(
      onTap: onClick,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black26,
              ),
            ),
          ),
          padding: EdgeInsets.all(10).copyWith(top: 10, bottom: 10),
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      modelKontakTeman.nama,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      modelKontakTeman.noTelepon,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    inheritedKontakTeman.hapus(this.index);

                    // ignore: invalid_use_of_protected_member
                    this.parent.setState(() {});
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
