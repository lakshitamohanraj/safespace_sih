
import 'package:censusdemo/src/common_widgets/form/form_header_widget.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_header_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    
    
    
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child:Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               FormHeaderWidget(image: tWelcomeScreenImage
                   , title: tLoginTitle
                   , subTitle: tLoginSubTitle),
                
                LoginForm(),
             
                LoginFooterWidget(),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
