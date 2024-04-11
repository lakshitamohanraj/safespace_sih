
import 'package:censusdemo/main.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

class PastViolence extends StatelessWidget {
  const PastViolence({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon:const Icon(Icons.arrow_back)),
        title:Text(tPastDetected,style:Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? Icons.light_mode:Icons.dark_mode)),
        ],
      ),
      body:SingleChildScrollView(
        child:Container(
          padding:const EdgeInsets.all(tDefaultSize),
          child:Column(
            children: [
              SizedBox(
                width:120 ,height:120,
                child:Image(Image)
              )
            ],
          ),
        ),
      ),
    );
  }
}
