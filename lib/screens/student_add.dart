import 'package:flutter/material.dart';
import 'package:untitled/models/student.dart';

import '../validation/student_validation_mixin.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı:", hintText: "Ahmet"),
      onSaved: (value) {
        student.firstName = value!;
      },
      validator: (value) {
        return validateFirstName(value!);
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci SoyAdı:", hintText: "Toklucu"),
      onSaved: (value) {
        student.lastName = value!;
      },
      validator: (value) {
        return validateLastName(value!);
      },
    );
  }

  Widget buildGradeField()
  {
    return TextFormField(
      decoration:
      InputDecoration(labelText: "Öğrenci Notu:", hintText: "0"),
      onSaved: (value) {
      student.grade = int.parse(value!);
      },
      validator: (value) {
        return validateGrade(value!);
      },
    );
  }

  Widget buildSubmitButton()
  {
    return ElevatedButton(
        onPressed: ()
        {
          if(formKey.currentState!.validate())
          {
            formKey.currentState!.save();
            saveStudent();
          }


        }, child: Text("Kaydet")
    );

  }

  void saveStudent()
  {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }


}
