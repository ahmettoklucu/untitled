import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState();
  }
}

class _StudentUpdateState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelleştir"),
      ),
      body: Center(
        child: Text("Öğrenci Formu Buraya Eklenecek."),
      ),
    );
  }
}
