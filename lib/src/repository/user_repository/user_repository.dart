

import 'dart:js_interop';

import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();


  final _db=FirebaseFirestore.instance;
  createUser(UserModel user) async{
    
   await  _db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.snackbar("Sucess", "You account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,),
    ).catchError((error,stackTrace) {
      Get.snackbar("Error", "Something went Wrong Try Again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      print(error.toString());
    });

    
  }

  //fetach user record using email

Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _db.collection("Users").where("Email",isEqualTo:email).get();
    final userData=snapshot.docs.map((e)=> UserModel.fromSnapshot(e)).single;
    return userData;

}
//fetch all
  Future<List<UserModel>> allUser() async{
    final snapshot = await _db.collection("Users").get();
    final userData=snapshot.docs.map((e)=> UserModel.fromSnapshot(e)).toList();
    return userData;

  }

  

}