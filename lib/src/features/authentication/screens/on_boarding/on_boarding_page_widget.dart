
import 'package:flutter/material.dart';
import 'package:censusdemo/src/features/authentication/models/model_on_boarding.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(tDefaultSize),
        color:model.bgColor,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(model.image),height: size.height*0.5,),

            Column(
              children: [
                Text(model.title,style: Theme.of(context).textTheme.headline2),
                Text(model.subTitle,textAlign: TextAlign.center,),
                const SizedBox(height:50.0,),
              ],
            ),

            Text(model.counterText),
          ],
        )
    );
  }
}
