import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListviewLayoutProblemleri extends StatelessWidget {
  const ListviewLayoutProblemleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deneme'),
      ),
      body: Container(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Container(width: 200, color: Colors.orange.shade200),
            Container(width: 200, color: Colors.orange.shade100),
            Container(width: 200, color: Colors.orange.shade200),
            Container(width: 200, color: Colors.orange.shade100),
            Container(width: 200, color: Colors.orange.shade200),
            Container(width: 200, color: Colors.orange.shade100),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.red),
        ),
      ),
    );
  }

  Column columnIcindeListe() {
    return Column(
      children: [
        Text('Başladı'),
        Expanded(
          child: ListView(
            children: [
              Container(height: 200, color: Colors.orange.shade200),
              Container(height: 200, color: Colors.orange.shade100),
            ],
          ),
        ),
        Text('Bitti'),
      ],
    );
  }
}
