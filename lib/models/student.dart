

class Student{
    late int Id;
    late String firstName;
    late String lastName;
    late int grade;
    late String status;

   Student.withId(int id,String firstName,String lastName,int grade ){
     this.Id=id;
     this.firstName=firstName;
     this.lastName=lastName;
     this.grade=grade;
   }
    Student(String firstName,String lastName,int grade ){
      this.firstName=firstName;
      this.lastName=lastName;
      this.grade=grade;
    }
    Student.withoutInfo(){

    }

   String get getStatus{
     String mesaj = "";
     if (this.grade >= 50) {
       mesaj = "Geçti";
     } else if (this.grade < 50 && this.grade >= 40) {
       mesaj = "Bütünlemeye kaldı";
     } else {
       mesaj = "Kaldı";
     }
     return mesaj;

   }


}