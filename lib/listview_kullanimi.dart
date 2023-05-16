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
        var nowOgrenci = tumOgrenciler[index];
        return Card(
          color: index % 2 == 0 ? Colors.green.shade200 : Colors.purple.shade200,
          child: ListTile(
            onTap: () {
              if (index % 2 == 0) {
                EasyLoading.instance.backgroundColor = Colors.amber;
              } else {
                EasyLoading.instance.backgroundColor = Colors.teal;
              }
              EasyLoading.showToast('Tıklandı!',
                  toastPosition: EasyLoadingToastPosition.bottom);
            },
            title: Text(nowOgrenci.isim),
            subtitle: Text(nowOgrenci.soyisim),
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
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}
