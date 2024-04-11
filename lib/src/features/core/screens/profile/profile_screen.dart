
import 'package:censusdemo/main.dart';
import 'package:censusdemo/src/constants/colors.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:censusdemo/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon:const Icon(Icons.arrow_back)),
        title:Text(tProfileHeading,style:Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? Icons.light_mode:Icons.dark_mode)),
        ],
      ),
      body:SingleChildScrollView(
        child:Container(
          padding:const EdgeInsets.all(tDefaultSize),
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
                    child:const Icon(Icons.change_history,size:18.0,color:Colors.grey),

                  ),

                ],
              ),
              const SizedBox(height:10),

              Text(tProfileHeading,style:Theme.of(context).textTheme.headline4),
              Text(tProfileSubHeading,style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height:20),

              SizedBox(
                width:200,
                child:ElevatedButton(
                  onPressed: (){
                    Get.to(()=>const UpdateProfileScreen());
                  },
                    child:const Text(tEditProfile,style:TextStyle(color:tDarkColor)),
                  style:ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                    side:BorderSide.none,
                    shape: const StadiumBorder(),
                  )
                ),
              ),

              const SizedBox(height: 30,),
              const Divider(),
              const SizedBox(height:10),

              ProfileMenuWidget(
                title:"Settings",icon:Icons.settings,onPress: (){},
              ),
              ProfileMenuWidget(
                title:"User Management",icon:Icons.verified_user,onPress: (){},
              ),
              ProfileMenuWidget(title:"Remove User",icon:Icons.remove,onPress: (){},),
              const Divider(),
              const SizedBox(height:10),
              ProfileMenuWidget(title:"Information" ,icon:Icons.info_outline,onPress: (){},),
              ProfileMenuWidget(
                title:"Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: (){},
              ),




            ],
          ),
        ),
      ),
    );
  }
}


