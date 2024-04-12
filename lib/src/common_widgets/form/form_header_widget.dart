import 'package:flutter/material.dart';


class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
   Key?key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
     this.textAlign,
    this.imageHeight=0.2,
    this.crossAxisAlignment=CrossAxisAlignment.start,

  }):super(key:key);

  //variables declared in constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  final String image,title,subTitle;


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image:AssetImage(image),height:size.height*0.2),
        Text(title,style:Theme.of(context).textTheme.headline2),
        Text(subTitle,textAlign:textAlign,style:Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}