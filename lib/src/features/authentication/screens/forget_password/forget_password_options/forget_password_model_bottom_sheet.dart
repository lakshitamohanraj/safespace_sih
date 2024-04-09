
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import '../forget_password_phone/forget_password_phoneno.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen{

static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context:context,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular((20.0))),
    builder:(context)=>Container(
      padding:EdgeInsets.all(tDefaultSize),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tForgetPasswordTitle,style:Theme.of(context).textTheme.headline2),
          Text(tForgetPasswordSubTitle,style:Theme.of(context).textTheme.bodyText1),
          const SizedBox(height:30.0),

          ForgetPasswordBtnWidget(
            onTap: (){
              Navigator.pop(context);
              Get.to(()=>const ForgetPasswordMailScreen());
            },
            btnIcon: Icons.mail_outline_rounded,
            title:tEmail,
            subtitle: tResetViaEmail,
                 ),
          const SizedBox(height:20.0),
          ForgetPasswordBtnWidget(
            btnIcon: Icons.mobile_friendly_rounded,
            title:tPhoneNo,
            subtitle: tResetViaPhone,
            onTap: (){
              Navigator.pop(context);
              Get.to(()=>const ForgetPasswordPhoneNoScreen());
            },
          ),



        ],
      ),
    ),
  );
}
}

