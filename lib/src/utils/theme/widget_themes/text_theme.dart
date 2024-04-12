import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme{
  static TextTheme lightTextTheme= TextTheme(
      headline2:GoogleFonts.montserrat(
        color:Colors.black87,
      ),
      subtitle2: GoogleFonts.poppins(
        color:Colors.black87,
        fontSize:24,
      ),
  );
  static TextTheme darkTextTheme= TextTheme(

      headline2:GoogleFonts.montserrat(
        color:Colors.white, //change it to light color lakshita
      ),
      subtitle2: GoogleFonts.poppins(
        color:Colors.white, //change it to light color lakshita
        fontSize:24,
      ),
  );

}