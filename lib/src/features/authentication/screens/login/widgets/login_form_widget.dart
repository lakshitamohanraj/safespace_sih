
import 'package:censusdemo/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../forget_password/forget_password_options/forget_password_btn_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {



    return Form(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: tFormHeight - 20,),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
              ),
              const SizedBox(height: tFormHeight - 20,),
              //Forget password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                }
                    , child: const Text(tForgotPassword)),
              ),

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                     // AuthenticationRepository.instance.loginWithEmailAndPassword(email, password)
                    },
                    child: Text(tLogin.toUpperCase()),
                  )
              )


            ],
          ),
        ));
  }
}