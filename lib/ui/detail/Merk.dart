import 'package:flutter/material.dart';

class Merk extends StatelessWidget {
  String merk;

  Merk({
    this.merk,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        '$merk',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
