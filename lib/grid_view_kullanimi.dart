import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GridViewOrnek extends StatelessWidget {
  const GridViewOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      primary: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade200,
          child: Text(
            'Merhaba dünya  ',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
