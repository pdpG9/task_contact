
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_contact/utils/colors.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fonSize;
  final FontWeight fontWeight;
  final Color textColor;
  const TextView({Key? key, required this.text, required this.fonSize, required this.fontWeight, this.textColor = mainTextColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.nunito(fontSize: fonSize,fontWeight: fontWeight,color: textColor,),);
  }
}
