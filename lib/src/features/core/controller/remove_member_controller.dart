
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:censusdemo/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RemoveController extends GetxController{
  static RemoveController get instance=> Get.find();

  final fullName=TextEditingController();
  final email=TextEditingController();

  final _authRepo=Get.put(AuthenticationRepository());
    final _userRepo=Get.put(UserRepository());

  //get user email and pass to user repository to fetch data

  deleteRecord(String email) async{
    await _userRepo.deleteUser(email);
  }

}