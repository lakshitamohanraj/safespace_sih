
import 'package:flutter/material.dart';

class DetailsOfMonitoring extends StatelessWidget {
  const DetailsOfMonitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
          width: 360,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),

    child:  SizedBox(
              width: 321,
              height: 409,
              child: Text.rich(
              TextSpan(
              children: [
              TextSpan(
              text: '\n',
              style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              ),
              ),
              ],
    ),
    ),
    ),
    );
    }
}
