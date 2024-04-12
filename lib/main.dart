import 'package:censusdemo/firebase_options.dart';
import 'package:censusdemo/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:censusdemo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:censusdemo/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
void main (){
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform)
  //     .then((value)=>Get.put(AuthenticationRepository()));
  Firebase.initializeApp(options:const FirebaseOptions(
      apiKey: "AIzaSyDyCyipFqdnGgLhYzRnuA6tdYVPNfJVE5M",
      projectId: "fir-ce64a",
      messagingSenderId: "453673442707",
      appId: "1:453673442707:web:ab86fd11913a4bc4b51c66"
  )).then((value)=>Get.put(AuthenticationRepository()));
  ;


  //app
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);





  return runApp(const App());
}


class App extends StatelessWidget{
  const App ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(

      themeMode: ThemeMode.light,
      theme:TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home:const Scaffold(
          body:Center(
              child:CircularProgressIndicator())),
    );
  }
}


