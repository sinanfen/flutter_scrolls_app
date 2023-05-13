import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) =>
        Ogrenci(index + 1, 'Öğrenci adı: ${index + 1}', 'Öğrenci soyadı: ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: ListView(
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
      ),
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}
