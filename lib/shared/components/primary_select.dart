import '../../constaints.dart';
import 'package:flutter/material.dart';

class PrimarySelectItemModel {
  final String text;
  final Object value;

  PrimarySelectItemModel(this.text, this.value);
}

class PrimarySelect extends StatelessWidget {
  final String placeholder;
  final String hintText;
  final String labelText;
  final List<PrimarySelectItemModel> items;
  dynamic value;

  String? errorText;
  TextInputType? keyboardType = TextInputType.text;
  bool? obscureText = false;
  Widget? suffix;
  Widget? preffix;
  BoxConstraints? prefixIconConstraints;
  BoxConstraints? suffixIconConstraints;
  FocusNode? focusNode;
  TextInputAction? textInputAction = TextInputAction.done;
  Function()? onEditingComplete;

  PrimarySelect(
      {Key? key,
      required this.items,
      required this.placeholder,
      required this.hintText,
      required this.labelText,
      this.value,
      this.errorText,
      this.keyboardType,
      this.obscureText,
      this.preffix,
      this.suffix,
      this.focusNode,
      this.textInputAction,
      this.onEditingComplete,
      this.suffixIconConstraints,
      this.prefixIconConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          labelStyle: const TextStyle(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor, width: 1.0),
          ),
          focusColor: textColor,
          fillColor: textColor,
          prefix: preffix,
          prefixIconConstraints: prefixIconConstraints,
          suffix: suffix,
          suffixIconConstraints: suffixIconConstraints,
          hintText: hintText,
          labelText: labelText,
          floatingLabelStyle: const TextStyle(color: textColor),
          errorText: errorText),
      onChanged: (val) {},
      style: const TextStyle(),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          child: Text(
            item.text,
            style: TextStyle(color: Colors.black),
          ),
          value: item.value,
        );
      }).toList(),
    );
  }
}
