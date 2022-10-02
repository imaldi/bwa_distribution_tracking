import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(this.borderRadius,
      {required this.child,
      this.boxDecoration = const BoxDecoration(color: Colors.white),
      Key? key,
      this.padding,
      this.margin,
      this.constraints})
      : super(key: key);
  final double borderRadius;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;

  /// Supaya masih bisa meng-custom box decoration walaupun sudah di beri nilai default
  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(sizeNormal),
      margin: margin ?? const EdgeInsets.symmetric(vertical: sizeNormal),
      constraints: constraints ?? const BoxConstraints(minHeight: sizeBig),
      decoration: boxDecoration.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
