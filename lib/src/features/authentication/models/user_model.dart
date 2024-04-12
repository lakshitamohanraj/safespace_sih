
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

   const UserModel({
    this.id,
     required this.email,
     required this.fullName,
     required this.password,
     required this.phoneNo,

});

   toJson(){
     return{
       "FullName":fullName,
       "Email": email,
       "Phone":phoneNo,
       "Password":password,
     };
   }

   // map user to fetched from firestore to usermodel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> document){
     final data=document.data()!;

     return UserModel(
       id:document.id,
         email: data["Email"],
         fullName: data["FullName"],
         password: data["Password"],
         phoneNo: data["Phone"],
     );
  }






}