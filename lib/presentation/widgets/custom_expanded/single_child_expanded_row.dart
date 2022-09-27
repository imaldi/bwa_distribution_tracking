import 'package:flutter/material.dart';

class SingleChildExpandedRow extends StatelessWidget {
  const SingleChildExpandedRow({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: child,),
      ],
    );
  }
}
