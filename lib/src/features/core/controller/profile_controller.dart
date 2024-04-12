
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:censusdemo/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController get instance=> Get.find();

  final _authRepo=Get.put(AuthenticationRepository());
  final _userRepo=Get.put(UserRepository());
  //get user email and pass to user repository to fetch data

  Future<UserModel>? getUserData(){
    final email=_authRepo.firebaseUser.value?.email;

    if(email!=null){
      return _userRepo.getUserDetails(email);
    }
    else{
      Get.snackbar("Error", "login to continue");
    }
  }


  Future<List<UserModel>> getAllUser() async{
    return await _userRepo.allUser();
  }
}