
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/core/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../controller/remove_member_controller.dart';


class RemoveMemberScreen extends StatelessWidget {
  const RemoveMemberScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller=Get.put(RemoveController());
    final _formKey=GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: "Remove Member",
                  subTitle: "Provide the Deatils of the member to be removed",
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical:tFormHeight-10),
                  child: Form(
                    key:_formKey,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          decoration: const InputDecoration(
                            label:Text(tFullName),
                            prefixIcon:Icon(Icons.person_outline_rounded,
                            ),
                          ),
                        ),
                        const SizedBox(height:tFormHeight-20),

                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            label:Text(tEmail),
                            prefixIcon:Icon(Icons.person_outline_rounded,
                            ),
                          ),
                        ),
                        const SizedBox(height:tFormHeight-10),

                        SizedBox(
                          width:double.infinity,
                          child: ElevatedButton(
                              onPressed: () async{
                                await controller.deleteRecord(controller.email.text.trim());
                              },
                              style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                side:BorderSide.none,
                              ),
                              child:  Text("Delete Member",
                              style: TextStyle(
                                color:Colors.white,
                              ),
                              ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
