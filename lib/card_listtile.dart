import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardVeListtileKullanimi extends StatelessWidget {
  const CardVeListtileKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card ve ListTile '),
      ),
      body: Center(
        child: Column(
          children: [
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
          ],
        ),
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
            color: Colors.blue.shade100,
            shadowColor: Colors.red,
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_2_outlined),
                backgroundColor: Colors.amber.shade200,
              ),
              title: Text('Ana Başlık'),
              subtitle: Text('Alt başlık'),
              trailing: Icon(Icons.person),
            )),
        Divider(
          color: Colors.red,
          thickness: 1,
          height: 10,
          indent: 10,
          endIndent: 10,
        )
      ],
    );
  }
}
