

import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/features/core/screens/dashboard/dashboard.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:censusdemo/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController{
   static SignUpController get instance=> Get.find();

   final email=TextEditingController();
   final password=TextEditingController();
   final fullName=TextEditingController();
   final phoneNo=TextEditingController();

   final userRepo=Get.put(UserRepository());
   void registerUser(String email,String password){
         AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
   }
   void phoneAuthentication(String phoneNo){
     AuthenticationRepository.instance.phoneAuthentication(phoneNo);
   }

   Future<void> createUser(UserModel user) async {
      await userRepo.createUser(user);
      //phoneAuthentication(user.phoneNo);
      //Get.to(()=>const OTPScreen());
      Get.to(()=>DashBoard());
   }

}
