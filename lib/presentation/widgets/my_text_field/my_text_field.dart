import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';

class MyTextField extends StatefulWidget {
  final String? label;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final bool? enabled;
  final int? maxLines;
  final Key? formKey;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  const MyTextField(
      {this.enabled,
      this.onChanged,
      this.onEditingComplete,
      this.contentPadding,
      this.keyboardType,
      this.onSaved,
      this.controller,
      this.label,
      this.borderRadius,
      this.maxLines,
        this.formKey,
        this.validator,
        this.suffixIcon,
        this.prefixIcon,
        this.textInputAction,
      Key? key})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    var primaryBorder = OutlineInputBorder(
        borderSide:
            const BorderSide(color: primaryGreen, style: BorderStyle.solid),
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? sizeNormal)));
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          // key: key,
          enabled: widget.enabled,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          onSaved: (val) {
            if (widget.onSaved != null) {
              print("VALUE: $val");
              widget.onSaved!(val);
            }
          },
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: widget.onEditingComplete,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(sizeMedium),
            labelText: widget.label,
            labelStyle: const TextStyle(color: Colors.grey),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            border: primaryBorder,
            focusedBorder: primaryBorder,
            enabledBorder: primaryBorder,
            disabledBorder: primaryBorder,
          ),
          maxLines: widget.maxLines,
          validator: widget.validator,
        ),
      ),
    );
  }
}
