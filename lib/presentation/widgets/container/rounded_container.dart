import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(this.borderRadius,
      {required this.child, this.boxDecoration = const BoxDecoration(
        color: Colors.white
      ), Key? key})
      : super(key: key);
  final double borderRadius;
  final Widget child;
  /// Supaya masih bisa meng-custom box decoration walaupun sudah di beri nilai default
  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(sizeNormal),
            margin: const EdgeInsets.symmetric(vertical: sizeNormal),
            constraints: const BoxConstraints(minHeight: sizeBig),
            decoration: boxDecoration.copyWith(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
