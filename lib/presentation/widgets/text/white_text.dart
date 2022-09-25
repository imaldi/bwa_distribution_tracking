import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:bwa_distribution_tracking/core/resources/text_style/white_text_extension.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.data,{this.color,this.size, this.textAlign, Key? key}) : super(key: key);
  final String data;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;

  // CustomText.white(this.data, {this.size, this.textAlign, Key? key }
  //
  //     ) : color = Colors.white, super(key: key)
  //
  // factory
  @override
  Widget build(BuildContext context) {
    return Text(data,
    textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

