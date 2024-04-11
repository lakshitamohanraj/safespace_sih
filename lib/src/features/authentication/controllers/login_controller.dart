

import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginInController extends GetxController{
  static LoginInController get instance=> Get.find();

  final email=TextEditingController();
  final password=TextEditingController();


  void loginInUser(String email,String password){
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }

}
