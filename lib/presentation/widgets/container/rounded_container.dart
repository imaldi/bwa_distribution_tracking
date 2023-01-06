import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatefulWidget {
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
        this.initState,
  }) : super(key: key);
  final double borderRadius;
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;
  final Clip? clipBehavior;
  final Function()? initState;

  /// Supaya masih bisa meng-custom box decoration walaupun sudah di beri nilai default
  final BoxDecoration boxDecoration;

  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  @override
  void initState() {
    super.initState();
    if(widget.initState != null){
      widget.initState!();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      clipBehavior: widget.clipBehavior ?? Clip.none,
      padding: widget.padding ?? const EdgeInsets.all(sizeNormal),
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: sizeNormal),
      constraints: widget.constraints ?? const BoxConstraints(minHeight: sizeBig),
      decoration: widget.boxDecoration.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: widget.child,
    );
  }
}
