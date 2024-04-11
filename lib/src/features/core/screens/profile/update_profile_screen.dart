
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
        icon:const Icon(Icons.arrow_back)
        ),
        title:Text(tEditProfile,style:Theme.of(context).textTheme.headline4),
      ),

      body:SingleChildScrollView(
         child:Container(
           padding: const EdgeInsets.all(tDefaultSize),
           child:Column(
             children: [
               Stack(
                 children: [
                   SizedBox(
                     width:120 ,height:120,
                     child:ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                         child: Image(
                           image:  AssetImage(tProfileImage),
                         )
                     ),
                   ),

                   Container(
                     width:35,
                     height:35,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(100),
                       color:tPrimaryColor,
                     ),
                     child:const Icon(Icons.camera,size:18.0,color:Colors.grey),

                   ),

                 ],
               ),

               const SizedBox(height:50),

               Form(
                 child:Column(
                 children: [
                   TextFormField(
                     // controller:controller.email,
                     decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.person_outline_outlined),
                       labelText: tFullName,
                       hintText: tFullName,
                       border: OutlineInputBorder(),
                     ),
                   ),

                   const SizedBox(height: tFormHeight - 20,),

                   TextFormField(
                    // controller:controller.email,
                     decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.person_outline_outlined),
                       labelText: tEmail,
                       hintText: tEmail,
                       border: OutlineInputBorder(),
                     ),
                   ),

                   const SizedBox(height: tFormHeight - 20,),

                   TextFormField(
                   //  controller:controller.password,
                     decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.phone_android_outlined),
                       labelText: tPhoneNo,
                       hintText: tPhoneNo,
                       border: OutlineInputBorder(),

                     ),
                   ),
                   const SizedBox(height: tFormHeight - 20,),

                   TextFormField(
                     //  controller:controller.password,
                     decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.password),
                       labelText: tPassword,
                       hintText: tPassword,
                       border: OutlineInputBorder(),
                       suffixIcon: IconButton(onPressed: null,
                         icon: Icon(Icons.remove_red_eye_sharp),
                       ),
                     ),
                   ),


                 const SizedBox(height:tFormHeight),
                 SizedBox(
                     width:double.infinity,
                   child:ElevatedButton(
                     onPressed: (){},
                     style:ElevatedButton.styleFrom(
                       backgroundColor: tPrimaryColor,side: BorderSide.none,
                       shape:const StadiumBorder()),
                       child:const Text(tEditProfile,style:TextStyle(color:tDarkColor)),
                     ),
                   ),

                    const SizedBox(height:tFormHeight),
           Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text.rich(
            TextSpan(
              text:"Team Members Count",
              style:TextStyle(fontSize:12),
              children: [
                TextSpan(text:"4",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
              ],
            )
          ),
          ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                elevation: 0,
                foregroundColor: Colors.red,
                shape:const StadiumBorder(),
                side:BorderSide.none,
              ),
              child: const Text("Leave Team"),
          ),
        ],
      ),



                 ],
               )),

             ],
           ),
         ),

      ),
    );
  }
}

