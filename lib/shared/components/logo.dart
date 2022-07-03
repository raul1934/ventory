import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image(
      image: const AssetImage('assets/images/logo.png'),
      width: size.width * 0.3,
    );
  }
}
