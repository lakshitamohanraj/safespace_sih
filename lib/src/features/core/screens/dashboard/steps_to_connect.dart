
import 'package:censusdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectCamScreen extends StatelessWidget {
  const ConnectCamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon:const Icon(Icons.arrow_back)
        ),
        title:Text("Connect Cam",style:Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
