import '../../constaints.dart';
import 'package:flutter/material.dart';

class OutlinedPrimaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const OutlinedPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 50,
      width: size.width * 0.7,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: primaryColor),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 3.0, color: primaryColor),
        ),
      ),
    );
  }
}
