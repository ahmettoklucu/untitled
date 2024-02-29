import 'package:flutter/material.dart';
import 'package:untitled/screens/student_add.dart';
import 'package:untitled/screens/student_update.dart';

import 'models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int not = 20;

  String Mesaj = "Öğretnci Takip Sistemi";

  List<Student> students = [
    Student.withId(1,"AHMET", "TOKLUCU", 65),
    Student.withId(2,"MUSTAFA", "TOKLUCU", 40),
    Student.withId(3,"NAZİRE", "TOKLUCU", 30)
  ];

  Student selectedStudent=Student.withId(0,"", "", 0);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Mesaj),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black),
              title: Text(
                  students[index].firstName + " " + students[index].lastName),
              subtitle: Text(
                  "Sinavdan aldığı not:" + students[index].grade.toString()),
              trailing: buildStatusIcon(students[index].grade),
              onTap: () {
                setState(() {
                 selectedStudent=students[index];
                });
              },
            );
          },
        )),
        Text("Seçili Öğrenci: " + selectedStudent.firstName+" "+selectedStudent.lastName),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Öğrenci Ekle"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));
                    })),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Güncelle"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentUpdate()));
                    })),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .amberAccent, // Arka plan rengini burada belirleyin
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Sil"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        students.remove(selectedStudent);
                      });//buradakı değişken alanlarini yeniden çiz demek

                      var mesaj = "Silindi : "+selectedStudent.firstName+" "+selectedStudent.lastName;
                      mesajGoster(context, mesaj);
                    })),
          ],
        )
      ],
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan < 50 && puan >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem sonucu : "),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade < 50 && grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
