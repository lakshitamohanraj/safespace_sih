
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/core/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../authentication/models/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =Get.put(ProfileController());

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
           child:FutureBuilder(
             future: controller.getUserData(),
             builder: (context,snapshot)
             {
               if(snapshot.connectionState==ConnectionState.done){
                    if(snapshot.hasData){
                      UserModel userData= snapshot.data as UserModel;


                      //controllers
                      final email=TextEditingController(text:userData.email);
                      final password=TextEditingController(text:userData.password);
                      final fullName=TextEditingController(text:userData.fullName);
                      final phoneNo=TextEditingController(text:userData.phoneNo);



                      return Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width:120 ,height:120,
                                child:ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Image(
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

                                    controller: fullName,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline_outlined),
                                      labelText: tFullName,
                                      hintText: tFullName,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),

                                  const SizedBox(height: tFormHeight - 20,),

                                  TextFormField(

                                     controller:email,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline_outlined),
                                      labelText: tEmail,
                                      hintText: tEmail,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),

                                  const SizedBox(height: tFormHeight - 20,),

                                  TextFormField(
                                    controller:phoneNo,

                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.phone_android_outlined),
                                      labelText: tPhoneNo,
                                      hintText: tPhoneNo,
                                      border: OutlineInputBorder(),

                                    ),
                                  ),
                                  const SizedBox(height: tFormHeight - 20,),

                                  TextFormField(

                                     controller:password,
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
                                      onPressed: () async{
                                        final userData=UserModel(
                                            email: email.text.trim(),
                                            fullName: fullName.text.trim(),
                                            password: password.text.trim(),
                                            phoneNo: phoneNo.text.trim(),);
                                        await controller.updateRecord(userData);

                                      },
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
                                              TextSpan(text:" 4",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
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
                      );
                    }
                    else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                      print(snapshot.error);
                    }else{
                      return const Center(child: Text('Something went wrong'));
                    }
               }
               else{
                 return const Center(child: CircularProgressIndicator(),);
               }
             },

           ),
         ),

      ),
    );
  }
}

