import 'package:censusdemo/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:censusdemo/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:censusdemo/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:censusdemo/src/constants/colors.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/authentication/screens/login/login_screen.dart';
import 'package:censusdemo/src/features/authentication/screens/signup/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget{
  const Welcome({super.key});
  @override
  Widget build(BuildContext context){

    final controller=Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery=MediaQuery.of(context);
    var height=mediaQuery.size.height;
    var brightness=mediaQuery.platformBrightness;

  //  final isDarkMode=brightness==Brightness.dark;
   final isDarkMode=false;
    return Scaffold(
      backgroundColor: isDarkMode? tSecondaryColor:tPrimaryColor,
     body:Stack(
       children: [
         TFadeInAnimation(
           durationInMs: 1200,
           animate: TAnimatePosition(
             bottomAfter: 0,
             bottomBefore: -100,
             leftBefore: 0,
             leftAfter: 0,
             topAfter: 0,
             topBefore: 0,
             rightAfter: 0,
             rightBefore: 0,
           ),
           child: Container(
             padding:const EdgeInsets.all(tDefaultSize),
             child:Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Image(image: const AssetImage(tLogoDark),
                 height:height*0.6),
                 Column(
                   children: [
                     Text(tWelcomeTitle,style: Theme.of(context).textTheme.headline2,),
                     Text(tWelcomeSubTitle,style: Theme.of(context).textTheme.subtitle2,
                     textAlign: TextAlign.center,),
                   ],
                 ),

                 Row(
                   children: [
                     Expanded(child: OutlinedButton(onPressed: ()=>{Get.to(()=>const LoginScreen())},

                       child: Text(tLogin.toUpperCase()),
                     )
                     ),
                     const SizedBox(width:10.0),
                     Expanded(child: ElevatedButton(onPressed: ()=>{Get.to(()=>const SignUpScreen())},

                         child: Text(tSignup.toUpperCase(),)
                     )
                     ),
                   ],
                 )
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }

}
