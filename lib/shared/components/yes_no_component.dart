import 'package:flutter/material.dart';

import '../../../constaints.dart';

class YesNoComponent extends StatefulWidget {
  final Function(bool value) onChanged;
  final String text;
  bool? value;

  YesNoComponent(
      {Key? key, required this.onChanged, this.value, required this.text})
      : super(key: key);

  @override
  State<YesNoComponent> createState() => _YesNoState();
}

class _YesNoState extends State<YesNoComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text.toString(), textScaleFactor: 1.3),
        const SizedBox(height: 15),
        Row(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      focusColor: primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: widget.value == null ? false : true,
                      groupValue: widget.value,
                      onChanged: (dynamic value) {
                        setState(() {
                          widget.value = value;
                        });
                      },
                      activeColor: Colors.green,
                    )),
                const Text("Sim", textScaleFactor: 1.3),
              ],
            ),
            const SizedBox(width: 30),
            Row(
              children: [
                const SizedBox(width: 10),
                Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      focusColor: primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: widget.value == null ? true : false,
                      groupValue: widget.value,
                      onChanged: (dynamic value) {
                        setState(() {
                          widget.value = value;
                        });
                      },
                      activeColor: Colors.green,
                    )),
                const Text("Não", textScaleFactor: 1.3),
              ],
            )
          ],
        )
      ],
    );
  }
}
