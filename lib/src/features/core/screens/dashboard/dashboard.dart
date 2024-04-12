import 'package:censusdemo/src/constants/colors.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:censusdemo/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../live_monitoring/video_streaming.dart';
import '../profile/profile_screen.dart';

class DashBoard extends StatelessWidget {
   DashBoard({super.key});

  bool violenceDetected = false;

  @override
  Widget build(BuildContext context) {

    final txtTheme=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.menu,color:Colors.black87),
        title: Text(tAppName,style:Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions:[
          Container(
            margin:const EdgeInsets.only(right:20, top:7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:tCardBgColor),
            child:IconButton(onPressed: (){
              Get.to(()=>ProfileScreen());
            },
                icon:const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),





      body: SingleChildScrollView( // Allow scrolling if content overflows
        child: Container(
          padding:const EdgeInsets.all(tDashboardCardPadding),
          child:Column(
            children: [
              Text("SafeSpace : Promoting healthy workplace",style: txtTheme.bodyText1),
              Text("Keep Workplace Safer",style: txtTheme.bodyText2),
              const SizedBox(height:tDashboardCardPadding),



          Stack( // Stack elements on top of each other
            children: [
              // Banner image (replace with your image provider)
              Image.asset("assets/images/banner.jpg",
                height: 200.0, // Adjust height as needed
                width: double.infinity, // Fills horizontal space
                fit: BoxFit.cover, // Cover the container
              ),
              Positioned( // Position slogan text
                top: 80.0, // Adjust position from top
                left: 16.0, // Adjust position from left
                child: Text(
                  'Slogans to keep here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned( // Position app logo
                top: 16.0, // Adjust position from top
                left: 16.0, // Adjust position from left
                child: Image.asset(
                  "assets/images/logo_light.png",
                  height: 50.0, // Adjust height as needed
                  width: 50.0, // Adjust width as needed
                ),
              ),
            ],
          ),









              //3 buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                  //direction: Axis.horizontal,
                  children: [
                                ElevatedButton(
                                  onPressed: (){
                                   // Get.to(()=>SignUpScreen());
                                  },
                                  style:ElevatedButton.styleFrom(
                                    side:BorderSide.none,
                                    backgroundColor: Colors.transparent,
            
                                  ),
            
                                    child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.blue),
                                  padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child:Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Icon(Icons.star,color:Colors.amber),
                                           Icon(Icons.history, color:Colors.blue),
                                        ],
                                      ),
                                      const SizedBox(height: 15,),
            
                                      Text("Past detected Violence", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      Text("view perivious violence", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                    ),
            
            
            
                                ),
            
                  const SizedBox(width: tDashboardCardPadding,),
            
            
                        ElevatedButton(
                          onPressed: (){
                            Get.to(()=>VideoStream());
                          },
            
                          style:ElevatedButton.styleFrom(
                            side:BorderSide.none,
                            backgroundColor: Colors.transparent,
                          ),
            
            
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.blue),
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child:Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
            
                                          Icon(Icons.star,color:Colors.amber),
                                           Icon(Icons.panorama_fish_eye, color:Colors.blue),
                                        ],
                                      ),
                                      const SizedBox(height: 15,),
                                      Text("Live Monitoring", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      Text("View your workplace", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
            
                        ),
            
            
                    const SizedBox(width:tDashboardCardPadding),
            
            
            
                        ElevatedButton(
                          onPressed: (){},
                          style:ElevatedButton.styleFrom(
                            side:BorderSide.none,
                            backgroundColor: Colors.transparent,
                          ),
            
                            child: Column(
                              children: [
                                Container(
            
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.blue),
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child:Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
            
                                          Icon(Icons.star,color:Colors.amber),
                                          Icon(Icons.phone_android_outlined, color:Colors.blue),
                                        ],
                                      ),
                                      const SizedBox(height: 15,),
                                      Text("Change Alert contacts", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      Text("Share the emergency to all", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
            
            
            
                                )
                              ],
                            ),),
            
            
            
            
                  ],
                ),
          ),


           //Notifications
           Text("Violence Detected",style:txtTheme.headline4?.apply(fontSizeFactor:1.2)),
          Column(

           children:[
             SizedBox(
             width:450,
             height:100,
             child:Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
               padding:const EdgeInsets.all(5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Violence detected on",
                      style:txtTheme.headlineSmall,
                      maxLines: 2, ),
                      Text("date and time , location",
                      style: txtTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,),

                    ],
                  ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward,)),
                 ],

               ),


             ),
           ),

             const SizedBox(height:20),


              SizedBox(
                width:450,
                height:100,
                child:Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
                  padding:const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Violence detected on",
                            style:txtTheme.headlineSmall,
                            maxLines: 2, ),
                          Text("date and time , location",
                            style: txtTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,),

                        ],
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward,)),
                    ],

                  ),


                ),
              ),

           ]
          ),




           const SizedBox(height:20),
            //Alert button
            Align(
            alignment: Alignment.bottomCenter, // Position at bottom right
            child: Padding(
            padding: const EdgeInsets.all(75.0), // Add some padding
            child: SizedBox(
              width:100,
              height:100,
              child: FloatingActionButton(
              onPressed: () {
              // Handle button press action (e.g., show alert dialog)
              print('Alert button pressed!');
              },
              backgroundColor: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("Alert",style:TextStyle(
                    color:Colors.white,
                    fontSize: 25,
                  ),
                  ),
                  Icon(
              Icons.notifications,
              color: Colors.white,
              ),
                ],
              ),
              ),
            ),
            ),
            ),


            ],
          ),
        ),
      ),
    );
  }




  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image.asset(tBannerImage2, height: 50.0), // Replace with your logo path
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lakshita', // Replace with user name
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _buildButton('Past Detected', Icons.history, () {
          // Handle 'Past Detected' button press
          // Navigate to a past detections screen or perform relevant actions
        }),
        SizedBox(height: tDefaultSize,),
        _buildButton('Live Monitoring', Icons.panorama_fish_eye, () {
          // Handle 'Live Monitoring' button press
          // Navigate to a live monitoring screen or initiate video stream processing
        }),
        SizedBox(height: tDefaultSize,),
        _buildButton('Alter Contacts', Icons.phone_android_outlined, () {
          // Handle 'Alter Contacts' button press
          // Navigate to a contact management screen or perform contact update actions
        }),
        SizedBox(height: tDefaultSize,),
      ],
    );
  }

  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20.0),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),

      ),
    );
  }


  Widget _buildViolenceDetectedSection() {
    return Visibility(
      visible: violenceDetected,
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Violence Detected!',
              style: TextStyle(color: Colors.red, fontSize: 18.0),
            ),
            SizedBox(width: 10.0),
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }


}




