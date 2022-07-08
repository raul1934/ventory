import '../../constaints.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const PrimaryButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 50,
      width: size.width * 0.7,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
