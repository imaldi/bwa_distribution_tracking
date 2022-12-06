import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
    this.borderRadius, {
    required this.child,
    this.boxDecoration = const BoxDecoration(color: Colors.white),
    Key? key,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.constraints,
    this.clipBehavior,
  }) : super(key: key);
  final double borderRadius;
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;
  final Clip? clipBehavior;

  /// Supaya masih bisa meng-custom box decoration walaupun sudah di beri nilai default
  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: clipBehavior ?? Clip.none,
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
