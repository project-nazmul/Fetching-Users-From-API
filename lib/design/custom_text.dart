import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key,this.text,this.fw,this.fs,this.clr}) : super(key: key);
  final String? text;
  final Color? clr;
  final double? fs;
  final FontWeight? fw;
  @override
  Widget build(BuildContext context) {
    return Text(text!,style: TextStyle(
      color: clr,
      fontWeight: fw,
      fontSize: fs,
    ),);
  }
}
