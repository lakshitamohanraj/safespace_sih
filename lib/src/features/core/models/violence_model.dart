
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViolenceModel{
  final String? id;
  final String location;
  final String severity;
  final String timeStamp;
  final String typeOfViolence;

  const ViolenceModel({
    this.id,
    required this.location,
    required this.severity,
    required this.timeStamp,
    required this.typeOfViolence,

  });

  toJson(){
    return{
      "Location":location,
      "TimeStamp": timeStamp,
      "TypeOfViolence":typeOfViolence,
      "Severity":severity,
    };
  }

  // map user to fetched from firestore to usermodel
  factory ViolenceModel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> document){
    final data=document.data()!;

    return ViolenceModel(
      id:document.id,
      location: data["Location"],
      timeStamp: data["TimeStamp"],
      typeOfViolence: data["TypeOfViolence"],
      severity: data["Severity"],
    );
  }

  

}