

//import 'dart:js_interop';

import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/features/core/models/violence_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViolenceRepository extends GetxController{
  static ViolenceRepository get instance => Get.find();


  final _db=FirebaseFirestore.instance;


  //fetach user record using email

  Future<List<ViolenceModel>> getViolenceDetails_2() async{
    final snapshot = await _db.collection("Violence").orderBy('timestamp', descending: true)
        .limit(2)
        .get();
    final violenceData=snapshot.docs.map((e)=> ViolenceModel.fromSnapshot(e)).toList();
    return violenceData;

  }
//fetch all
  Future<List<ViolenceModel>> allViolence() async{
    final snapshot = await _db.collection("Violence").get();
    final violenceData=snapshot.docs.map((e)=> ViolenceModel.fromSnapshot(e)).toList();
    return violenceData;

  }



}