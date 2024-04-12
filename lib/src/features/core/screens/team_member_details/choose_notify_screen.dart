import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';


class ChooseMemberNotifyScreen extends StatefulWidget {
  const ChooseMemberNotifyScreen({super.key});

  @override
  State<ChooseMemberNotifyScreen> createState() => _ChooseMemberNotifyScreenState();
}

class _ChooseMemberNotifyScreenState extends State<ChooseMemberNotifyScreen> {
  @override
  Widget build(BuildContext context) {


    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon:const Icon(Icons.arrow_back)
        ),
        title:Text("Members to Notify",style:Theme.of(context).textTheme.headline4),
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
                  int selectedIndex = 3;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (c,index){

                        final isSelected = selectedIndex == index;

                        return Column(
                          children: [
                            ListTile(
                              iconColor: isSelected ? Colors.green : Colors.blue, // Change color based on selection
                              tileColor: isSelected ? Colors.green.withOpacity(0.1): Colors.blue.withOpacity(0.1),

                              leading:const Icon(Icons.verified_user),
                              title:Text("Name :${snapshot.data![index].fullName}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].phoneNo),
                                  Text(snapshot.data![index].email),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
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
