

import 'package:censusdemo/src/features/core/screens/dashboard/dashboard.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();


  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified? Get.offAll(DashBoard()): Get.back();
  }
}