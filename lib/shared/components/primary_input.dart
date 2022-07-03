import '../../constaints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryInput extends StatelessWidget {
  final String placeholder;
  final String hintText;
  final String labelText;

  String? errorText;
  TextInputType? keyboardType = TextInputType.text;
  bool? obscureText = false;
  Widget? suffix;
  Widget? preffix;
  BoxConstraints? prefixIconConstraints;
  BoxConstraints? suffixIconConstraints;
  List<TextInputFormatter>? inputFormatters = [];
  FocusNode? focusNode;
  TextInputAction? textInputAction = TextInputAction.done;
  Function()? onEditingComplete;
  Function(String? text) onSaved;
  Function(String? text) onChanged;
  Function(String? text) onFieldSubmitted;

  PrimaryInput(
      {Key? key,
      required this.placeholder,
      required this.hintText,
      required this.labelText,
      this.errorText,
      this.keyboardType,
      this.inputFormatters,
      this.obscureText,
      this.preffix,
      this.suffix,
      this.focusNode,
      this.textInputAction,
      this.onEditingComplete,
      required this.onSaved,
      required this.onChanged,
      required this.onFieldSubmitted,
      this.suffixIconConstraints,
      this.prefixIconConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      cursorColor: textColor,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: const TextStyle(),
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
