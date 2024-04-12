
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:censusdemo/src/repository/user_repository/user_repository.dart';
import 'package:censusdemo/src/repository/violence_repository/violence_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/violence_model.dart';

class PastViolenceController extends GetxController{
  static PastViolenceController get instance=> Get.find();

  final _violenceRepo=Get.put(ViolenceRepository());
  //get user email and pass to user repository to fetch data

  // Future<UserModel>? getUserData(){
  //   final email=_authRepo.firebaseUser.value?.email;
  //
  //   if(email!=null){
  //     return _userRepo.getUserDetails(email);
  //   }
  //   else{
  //     Get.snackbar("Error", "login to continue");
  //   }
  // }


  Future<List<ViolenceModel>> getAllViolence() async{
    return await _violenceRepo.allViolence();
  }

  Future<List<ViolenceModel>> getOnly2() async{
    return await _violenceRepo.getViolenceDetails_2();
  }


}