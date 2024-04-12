import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:censusdemo/src/features/core/models/violence_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/past_violence_controller.dart';
import '../../controller/profile_controller.dart';


class PastViolenceScreen extends StatelessWidget {
  const PastViolenceScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PastViolenceController());
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon:const Icon(Icons.arrow_back)
        ),
        title:Text("Past Violence",style:Theme.of(context).textTheme.headline4),
      ),

      body: SingleChildScrollView(
        child:Container(
          padding:const EdgeInsets.all(tDefaultSize),
          child:FutureBuilder<List<ViolenceModel>>(
            future: controller.getAllViolence(),

            builder: (context,snapshot)
            {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  //  UserModel userData= snapshot.data as UserModel;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (c,index){
                        return Column(
                          children: [
                            ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
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
                              title:Text("Type :${snapshot.data![index].typeOfViolence}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("TimeStamp: ${snapshot.data![index].timeStamp}"),
                                  Text("Location: ${snapshot.data![index].location}"),
                                  Text("Severity: ${snapshot.data![index].severity}"),
                                ],
                              ),
                            ),
                            const SizedBox(height:10),
                          ],
                        );
                      }
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
