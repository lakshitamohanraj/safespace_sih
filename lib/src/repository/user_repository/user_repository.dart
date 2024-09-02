

// import 'dart:js_interop';

import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

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

  Future<void> updateUserRecord(UserModel user) async{
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String email) async {
    // 1. Fetch user by email
    final user = await getUserDetails(email);

    if (user != null) {
      // 2. Delete user from Firebase Authentication (if successful)
      await _auth.currentUser!.delete().then((_) async {
        // 3. Optionally delete user document from Firestore
        await _db.collection("Users").doc(user.id).delete();
        Get.snackbar(
          "Success",
          "User with email $email has been deleted.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      }).catchError((error) {
        Get.snackbar(
          "Error",
          "Failed to delete user: ${error.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      });
    } else {
      Get.snackbar(
        "Error",
        "User with email $email not found.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }




  

}