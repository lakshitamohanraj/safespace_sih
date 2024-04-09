
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordPhoneNoScreen extends StatelessWidget {
  const ForgetPasswordPhoneNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.all(tDefaultSize),
            child:Column(
              children:  [
                const  SizedBox(height: tDefaultSize*4,),

                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgotPassword,
                  subTitle: tForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween:30.0,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height:tFormHeight),

                Form(
                  child:Column(
                    children: [
                      TextFormField(
                        decoration:InputDecoration(
                          label: Text(tPhoneNo),
                          hintText:tPhoneNo,
                          prefixIcon: Icon(Icons.phone_android_outlined),
                        ),
                      ),

                      const SizedBox(height:20.0),
                      SizedBox(
                          width:double.infinity,
                          child: ElevatedButton
                            (onPressed: () {
                            Get.to(() => const OTPScreen());
                          },
                              child: const Text(tNext)))

                    ],
                  ),
                ),


              ],
            ),

          ),
        ),
      ),
    );
  }
}