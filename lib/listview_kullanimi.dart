import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    1000,
    (index) =>
        Ogrenci(index + 1, 'Öğrenci adı: ${index + 1}', 'Öğrenci soyadı: ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: buildListViewSeperated(),
    );
  }

  ListView buildListViewSeperated() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var oAnkiOgrenci = tumOgrenciler[index];
        return Card(
          color: index % 2 == 0 ? Colors.green.shade200 : Colors.purple.shade200,
          child: ListTile(
            onTap: () {
              if (index % 2 == 0) {
                EasyLoading.instance.backgroundColor = Colors.amber.shade200;
                EasyLoading.instance.textColor = Colors.white;
              } else {
                EasyLoading.instance.backgroundColor = Colors.teal.shade200;
                EasyLoading.instance.textColor = Colors.white;
              }
              EasyLoading.showToast('Tıklandı!',
                  toastPosition: EasyLoadingToastPosition.bottom);
            },
            onLongPress: () {
              _alertDialogIslemleri(context, oAnkiOgrenci);
            },
            title: Text(oAnkiOgrenci.isim),
            subtitle: Text(oAnkiOgrenci.soyisim),
            leading: CircleAvatar(
                child: Icon(
              Icons.person_2_rounded,
            )),
          ),
        );
      },
      itemCount: tumOgrenciler.length,
      separatorBuilder: (context, index) {
        var yeniIndex = index + 1;
        if (yeniIndex % 4 == 0) {
          return Divider(
            thickness: 1,
            color: Colors.teal,
          );
        }
        return SizedBox();
      },
    );
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogrenci) => ListTile(
                title: Text(ogrenci.isim),
                subtitle: Text(ogrenci.soyisim),
                leading: CircleAvatar(
                    child: Icon(
                  Icons.person_2_rounded,
                )),
              ))
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text(secilen.toString()),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              ],
            )),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      //O andaki açık olan ekrandan bir adım geriye getirir
                    },
                    child: Text('KAPAT'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('TAMAM'),
                  )
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);

  @override
  String toString() {
    // TODO: implement toString
    return 'Isim: $isim - Soyisim: $soyisim - id: $id';
  }
}
