import 'package:censusdemo/src/constants/colors.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:censusdemo/src/features/core/screens/dashboard/steps_to_connect.dart';
import 'package:censusdemo/src/features/core/screens/past_violence/past_violence_list_screen.dart';
import 'package:censusdemo/src/features/core/screens/team_member_details/choose_notify_screen.dart';
import 'package:censusdemo/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/past_violence_controller.dart';
import '../../models/violence_model.dart';
import '../live_monitoring/video_streaming.dart';
import '../profile/profile_screen.dart';

class DashBoard extends StatelessWidget {
   DashBoard({super.key});

  bool violenceDetected = false;

   final controller = Get.put(PastViolenceController());

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

              const Banner(),

           const SizedBox(height:20) ,
              const ConnectCamButton(),

              //3 buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                  //direction: Axis.horizontal,
                  children:  [
                          const PastDetectedButton(),

                   const SizedBox(width: tDashboardCardPadding,),
                        const LiveStreamButton(),

                    const SizedBox(width:tDashboardCardPadding),
                    const NotifyMemberButton(),
            

                  ],
                ),
          ),


           //Notifications
           Text("Violence Detected",style:txtTheme.headline4?.apply(fontSizeFactor:1.2)),
          // Column(
          //
          //  children:[
          //    SizedBox(
          //    width:450,
          //    height:100,
          //    child:Container(
          //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
          //      padding:const EdgeInsets.all(5),
          //      child: Row(
          //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //        children: [
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("Violence detected on",
          //             style:txtTheme.headlineSmall,
          //             maxLines: 2, ),
          //             Text("date and time , location",
          //             style: txtTheme.bodySmall,
          //             overflow: TextOverflow.ellipsis,),
          //
          //           ],
          //         ),
          //          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward,)),
          //        ],
          //
          //      ),
          //
          //
          //    ),
          //  ),
          //
          //    const SizedBox(height:20),
          //
          //
          //     SizedBox(
          //       width:450,
          //       height:100,
          //       child:Container(
          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
          //         padding:const EdgeInsets.all(5),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text("Violence detected on",
          //                   style:txtTheme.headlineSmall,
          //                   maxLines: 2, ),
          //                 Text("date and time , location",
          //                   style: txtTheme.bodySmall,
          //                   overflow: TextOverflow.ellipsis,),
          //
          //               ],
          //             ),
          //             IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward,)),
          //           ],
          //         ),
          //
          //       ),
          //     ),
          //  ]
          // ),


              // SingleChildScrollView(
              //   child: Container(
              //       padding:const EdgeInsets.all(tDefaultSize),
              //       child:FutureBuilder<List<ViolenceModel>>(
              //         future: controller.getOnly2(),
              //
              //         builder: (context,snapshot)
              //         {
              //           if(snapshot.connectionState==ConnectionState.done){
              //             if(snapshot.hasData){
              //               //  UserModel userData= snapshot.data as UserModel;
              //               return ListView.builder(
              //                   shrinkWrap: true,
              //                   itemCount: snapshot.data!.length,
              //                   itemBuilder: (c,index){
              //                     return Column(
              //                       children: [
              //                         ListTile(
              //                           iconColor: Colors.red,
              //                           tileColor: Colors.red.withOpacity(0.1),
              //                           leading: ClipRRect( // Clip image for rounded corners
              //                             borderRadius: BorderRadius.circular(8.0), // Adjust corner radius
              //                             child: Image.asset(
              //                               "assets/images/sample_violence/beating.jpeg",
              //                               fit: BoxFit.cover, // Cover the container
              //                               width: 50.0, // Adjust image width
              //                               height: 50.0, // Adjust image height
              //                             ),
              //                           ),
              //                           trailing:IconButton( // Use IconButton for trailing button
              //                             icon: const Icon(Icons.arrow_forward_ios), // Icon for navigation
              //                             onPressed: () {},
              //                           ),
              //                           title:Text("Type :${snapshot.data![index].typeOfViolence}"),
              //                           subtitle: Column(
              //                             crossAxisAlignment: CrossAxisAlignment.start,
              //                             children: [
              //                               Text("TimeStamp: ${snapshot.data![index].timeStamp}"),
              //                               Text("Location: ${snapshot.data![index].location}"),
              //                               Text("Severity: ${snapshot.data![index].severity}"),
              //                             ],
              //                           ),
              //                         ),
              //                         const SizedBox(height:10),
              //                       ],
              //                     );
              //                   }
              //               );
              //             }
              //             else if(snapshot.hasError){
              //               return Center(child: Text(snapshot.error.toString()));
              //               print(snapshot.error);
              //             }else{
              //               return const Center(child: Text('Something went wrong'));
              //             }
              //           }
              //           else{
              //             return const Center(child: CircularProgressIndicator(),);
              //           }
              //         },
              //
              //
              //
              //       ),
              //     ),
              // ),

          ListTile(
                                      iconColor: Colors.red,
                                      tileColor: Colors.red.withOpacity(0.1),
                                      leading: ClipRRect( // Clip image for rounded corners
                                        borderRadius: BorderRadius.circular(8.0), // Adjust corner radius
                                        child: Image.asset(
                                          "assets/images/sample_violence/beating.jpeg",
                                          fit: BoxFit.cover, // Cover the container
                                          width: 50.0, // Adjust image width
                                          height: 50.0, // Adjust image height
                                        ),
                                      ),
                                      trailing:IconButton( // Use IconButton for trailing button
                                        icon: const Icon(Icons.arrow_forward_ios), // Icon for navigation
                                        onPressed: () {},
                                      ),
                                      title:Text("Type :Assault"),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("TimeStamp: 2024:9:03 23:00:00"),
                                          Text("Location: halfway"),
                                          Text("Severity: 0.677"),
                                        ],
                                      ),
          ),

           const SizedBox(height:30),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }



}

class NotifyMemberButton extends StatelessWidget {
  const NotifyMemberButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Get.to(()=>ChooseMemberNotifyScreen());
      },
      style:ElevatedButton.styleFrom(
        side:BorderSide.none,
        backgroundColor: Colors.transparent,
      ),

        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:tButton3bg),
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child:Column(
                children: [
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      Icon(Icons.star,color:tYellowColor),
                      Icon(Icons.phone_android_outlined, color:tWhiteColor),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Text("Change Alerts to Member", style: GoogleFonts.montserrat(
                    color:Colors.white,
                    fontSize:24,
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  Text("Share the emergency to all", style: GoogleFonts.montserrat(
                    color:Colors.white,
                  ),maxLines: 1,overflow: TextOverflow.ellipsis,)
                ],
              ),



            )
          ],
        ),);
  }
}

class LiveStreamButton extends StatelessWidget {
  const LiveStreamButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:tButton3bg),
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child:Column(
                children: [
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      Icon(Icons.star,color:tYellowColor),
                       Icon(Icons.panorama_fish_eye, color:tWhiteColor),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Text("Live Monitoring", style: GoogleFonts.montserrat(
                    color:Colors.white,
                    fontSize:24,
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  Text("View your workplace", style: GoogleFonts.montserrat(
                    color:Colors.white,
                  ),maxLines: 1,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),

    );
  }
}

class PastDetectedButton extends StatelessWidget {
  const PastDetectedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Get.to(()=>PastViolenceScreen());
      },
      style:ElevatedButton.styleFrom(
        side:BorderSide.none,
        backgroundColor: Colors.transparent,
      ),

        child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:tButton3bg),
      padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child:Column(
        children: [
          Row(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.star,color:tYellowColor),
               Icon(Icons.history, color:tWhiteColor),
            ],
          ),
          const SizedBox(height: 15,),

          Text("Past detected Violence",
            style: GoogleFonts.montserrat(
              color:Colors.white,
              fontSize:24,
            ),
          ),
              //fontFamily: txtTheme.headline4,),maxLines: 2,overflow: TextOverflow.ellipsis,),
          Text("view perivious violence", style: GoogleFonts.poppins(
            color:Colors.white,

          ),maxLines: 1,overflow: TextOverflow.ellipsis,),
        ],
      ),
        ),

    );
  }
}

class ConnectCamButton extends StatelessWidget {
  const ConnectCamButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:200,
      child:ElevatedButton(
          onPressed: (){
            Get.to(()=>const ConnectCamScreen());
          },
          child:const Text("Connect Device-Cam",style:TextStyle(color:tDarkColor)),
          style:ElevatedButton.styleFrom(
            backgroundColor: tPrimaryColor,
            side:BorderSide.none,
            shape: const StadiumBorder(),
          )
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tPrimaryColor.withOpacity(0.1),
      leading: Image.asset(tLogoDark,
        height: 500.0,
        fit: BoxFit.cover,
      ),
      title: Text('Why need SafeSpace?',style:TextStyle(
        fontSize: 24.0,
      ),),
      subtitle:
      Text('To Safeguard workers and people,manage them with a team',style:TextStyle(
        fontSize: 20.0,
      ),),

    );
  }
}




