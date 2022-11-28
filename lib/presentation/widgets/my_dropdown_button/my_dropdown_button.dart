import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/sizes.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/consts/function_types.dart';

class MyDropdownButton<T> extends StatefulWidget {
  MyDropdownButton(
    this.values,
    this.textValue, {
    Key? key,
    this.onChanged,
    this.onItemTapped,
    this.isEnabled = true,
    this.value,
    this.validator,
    this.formKey,
    this.textInCenter = false,
    this.defaultChoiceFunction,
    this.hint,
  }) : super(key: key);

  // Function defaultOnItemTapped;
  final List<T> values;
  final DropdownTextClosure<T> textValue;
  final OnChangedDropdownClosure<T>? onChanged;
  final bool isEnabled;
  Function(dynamic)? onItemTapped;
  final dynamic value;
  String? Function(dynamic value)? validator;
  Key? formKey;
  bool? textInCenter;
  bool? defaultChoiceFunction;
  Widget? hint;

  // final DropdownButton<T> myDropdownButton;

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState<T>();
}

class _MyDropdownButtonState<T> extends State<MyDropdownButton<T>> {
  // T? get selectedValue => widget.values[0];
  dynamic selectedValue;

  DropdownButtonFormField<T> _myDropdownButton<T>(
    List<T> values,
    DropdownTextClosure<T> textValue,
  ) {
    // int index = ;
    List<DropdownMenuItem<T>>? items = values.map((T e) {
      final onTap = () => setState(() {
            selectedValue = e;
            widget.onItemTapped!(e);
          });
      return DropdownMenuItem(
          onTap: ((values.indexOf(e) != 0 && widget.onItemTapped != null) ||
                  widget.defaultChoiceFunction == true)
              ? onTap
              : null,
          value: e,
          child: widget.textInCenter ?? false
              ? Center(child: Text(textValue(e)))
              : Text(textValue(e)));
    }).toList();
    var primaryBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: primaryGreen,style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(sizeMedium)));
    return DropdownButtonFormField<T>(
      items: items,
      isExpanded: true,
      // value: values[],
      value: selectedValue ?? widget.value,
      // style: TextStyle(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: primaryGreen),
      decoration: InputDecoration(
        focusColor: Colors.white,
        contentPadding: EdgeInsets.all(sizeMedium),
        border: primaryBorder,
        focusedBorder: primaryBorder,
        enabledBorder: primaryBorder,
        disabledBorder: primaryBorder,
      ),
      hint: widget.hint,
      borderRadius: const BorderRadius.all(Radius.circular(sizeMedium)),
      // values.first,

      onChanged: widget.isEnabled
          ? (obj) {
              // if (values.indexOf(obj!) > 0) {
              //   onChanged(obj);
              // }
            }
          : null,
      validator: widget.validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: sizeMedium),
            child: _myDropdownButton<T>(widget.values, widget.textValue)));
  }
}
