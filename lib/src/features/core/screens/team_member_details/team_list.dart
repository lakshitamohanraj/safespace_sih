import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';


class TeamListScreen extends StatelessWidget {
  const TeamListScreen({super.key});

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
          title:Text("Team Members",style:Theme.of(context).textTheme.headline4),
      ),

      body: SingleChildScrollView(
        child:Container(
          padding:const EdgeInsets.all(tDefaultSize),
          child:FutureBuilder<List<UserModel>>(
            future: controller.getAllUser(),


            builder: (context,snapshot)
            {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  UserModel userData= snapshot.data as UserModel;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c,index){
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading:const Icon(Icons.verified_user),
                            title:Text("Name :${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          ),
                          const SizedBox(height:10),
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading:const Icon(Icons.verified_user),
                            title:Text("Name :${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          ),



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
